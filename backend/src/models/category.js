const { Sequelize, DataTypes } = require("sequelize");
const sequelize = require("../db/sequelize");
const Food = require("./food");

const Category = sequelize.define(
  "Category",
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: "name",
    },
    imagePath: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    color: {
      type: DataTypes.CHAR,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Category;
