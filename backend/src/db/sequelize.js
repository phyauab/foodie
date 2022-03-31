const { Sequelize } = require("sequelize");
const DATABASE = process.env.DATABASE;
const USERNAME = process.env.USERNAME;
const PASSWORD = process.env.PASSWORD;
const HOST = process.env.HOST;
const CLOUD_SQL_INSTANCES = process.env.CLOUD_SQL_INSTANCES;

const sequelize = new Sequelize(DATABASE, USERNAME, PASSWORD, {
  // host: `/cloudsql/${CLOUD_SQL_INSTANCES}`,
  host: HOST,
  dialect: "mysql",
  timestamps: false,
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000,
  },
  // dialectOptions: {
  //   socketPath: `/cloudsql/${CLOUD_SQL_INSTANCES}`,
  // },
});

module.exports = sequelize;
