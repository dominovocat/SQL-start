const { QueryTypes } = require("sequelize");
// const client = require("../models");
const User = require("../models/user");

module.exports.createUser = async () => {}

module.exports.getUserList = async (limit, page) => {
  const foundUsers = await User.findAll({
    limit: limit,
    offset: (page - 1) * limit,
  });

  return foundUsers;
}
module.exports.getUserById = async (userId) => {
  
  // const qInt = client.getQueryInterface();

  // const foundUsers = await qInt.select(null,'users',{ where:{
  //   id:userId,
  // } });

  // const foundUsers  = await client.query(`
  //   SELECT * FROM "users" WHERE "id" = ${userId}
  // `,{type:QueryTypes.SELECT});

  // const foundUsers = await User.findByPk(userId);
  // const foundUsers = await User.findOne;

  // if (foundUsers.length === 0) {
  //   return null;
  // }


  const user = await User.findByPk(userId);
  return user;
}