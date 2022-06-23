const { QueryTypes } = require("sequelize");
const client = require("../models");

module.exports.createUser = async () => {
  
}

module.exports.getUserList = async (limit, page) => {
  
}

module.exports.getUserById = async (userId) => {
  const qInt = client.getQueryInterface();
  
  const foundUsers = await qInt.select(null,'users',{ where:{
    id:userId,
  } });

  // const foundUsers  = await client.query(`
  //   SELECT * FROM "users" WHERE "id" = ${userId}
  // `,{type:QueryTypes.SELECT});

  if (foundUsers.length === 0) {
    return null;
  }

  return foundUsers[0];
}