const { Sequelize, DataTypes } = require("sequelize");
const sequelize = require("../db/sequelize");

const Transaction = sequelize.define(
  "Transaction",
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    type: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    amount: {
      type: DataTypes.DOUBLE,
      allowNull: false,
      isIn: [["Order", "Add Balance"]],
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Transaction;
