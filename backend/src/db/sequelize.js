const { Sequelize } = require("sequelize");

const sequelize = new Sequelize("foodie", "root", "admin", {
  host: "localhost",
  dialect: "mysql",
});

module.exports = sequelize;
