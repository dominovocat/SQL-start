

module.exports.up = async(client)=>{
  //ALTER ADD COLUMN firstName, lastName

  await client.query(`
  ALTER TABLE users
  ADD COLUMN firstName VARCHAR(128) NOT NULL CHECK(char_length(firstName)>=3),
  ADD COLUMN lastName VARCHAR(128) NOT NULL CHECK(char_length(firstName)>=3)
  `);
  //ALTER ADD COLUMN isMale

  await client.query(`
  ALTER TABLE users
  ADD COLUMN isMale boolean NOT NULL
  `);

  //SELECT users 
  
    const users = await client.query(`
    SELECT * FROM users
    `);
  //INSERT RANDOM isMale

  await Promise.all(
    users.map()
  )
  // UPDATE users  SET firstName = '', lastName = ''
  //WHERE id 
  //DROP COLUMN full_name

  await client.query();
};