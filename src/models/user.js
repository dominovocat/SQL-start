const { Model, DataTypes } = require("sequelize");
const client = require("./index");

class User extends Model {}

User.init(
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey:true,
    },
    full_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    email: {
      type: "string",
      allowNull: false,
      unique: true,
    },
    country:{
      type:DataTypes.STRING,
      allowNull:true,
    },
    dob:{
      type:DataTypes.DATEONLY,
      allowNull:false,
    },
    tall:{
      type:DataTypes.DECIMAL(3.2),
      allowNull:false
    },
  },
  { tableName:'users',
    sequelize: client }
);

module.exports = User;
