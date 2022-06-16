const { createSQLString } = require("./utils");
const axios = require("axios");

const createUserRow = (full_name, email, dob, country, tall) => `
(
  ${createSQLString(full_name)},
  ${createSQLString(email)},
  ${createSQLString(dob)},
  ${createSQLString(country)},
  ${tall.toFixed(2)}
)`;
module.exports.createUserRow = createUserRow;

const getUsersFromServer = async () => {
  const {
    data: { results: users },
  } = await axios.get("https://randomuser.me/api/?results=50&seed=fresh");

  const userValues = users.map((user) =>
    createUserRow(
      `${user.name.first} ${user.name.last}`,
      user.email,
      user.dob.date,
      user.location.state,
      Math.random() * 2 + 0.2
    )
  );

  return userValues;
};

module.exports.getUsersFromServer = getUsersFromServer;

module.exports.userQueries = async (client) => {
  // await client.query(`
  //   ALTER TABLE users
  //   ADD COLUMN tall numeric(3, 2)
  //   NOT NULL CHECK(tall BETWEEN 0.2 AND 3.00) DEFAULT 0.3
  // `);

  const userValues = await getUsersFromServer();

  const queryString = `
  INSERT INTO users
  (full_name, email, dob, country, tall)
  VALUES
  ${userValues.join(", ")};
  `;
  console.log(queryString);

  await client.query(queryString);
};
