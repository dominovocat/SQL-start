const fs = require("fs/promises");
const path = require('path');

module.exports.migrate = async (client) => {
  await client.query(`
  CREATE TABLE IF NOT EXISTS migrations
  (
    name VARCHAR(128) PRIMARY KEY CHECK(name !='')
  );
  `);
  const migrations = await client.query(`
    SELECT * FROM migrations;

  `);

  const filesNames = await fs.readdir(
    path.resolve(__dirname,"./migrations/")
  );
  for (const fileName of filesNames) {
    const filepath = path.resolve(__dirname, "./migrations/",fileName);
    const module = require(filepath);

    if (!migrations.includes(fileName)) {
      await module.up(client);
      await client.query(`
    INSERT INTO migrations
    VALUES
    ('${fileName}')
    `);
    }
  }
};
