const { Sequelize, DataTypes } = require("sequelize");
const sequelize = require("../db/sequelize");
const Category = require("./category");

const Food = sequelize.define(
  "Food",
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
    },
    price: {
      type: DataTypes.DOUBLE,
      allowNull: false,
      defaultValue: 0.0,
      validate: {
        min: 0.0,
      },
    },
    rating: {
      type: DataTypes.DOUBLE,
      allowNull: true,
      defaultValue: 0.0,
      validate: {
        min: 0.0,
        max: 5.0,
      },
    },
    minCookingTime: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        min: 0.0,
        max: 60.0,
      },
    },
    maxCookingTime: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        min: 0.0,
        max: 60.0,
      },
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    imagePath: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    popular: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Food;
