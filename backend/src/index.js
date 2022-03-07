const app = require("./app");
const port = 3000;
const sequelize = require("./db/sequelize");
const defineRelationships = require("./models/relationships/relationship");

app.listen(port, async () => {
  console.log(`The app is listening to ${port}`);
  try {
    await sequelize.authenticate();
    console.log("Connection has been established successfully.");
    defineRelationships();
    await sequelize.sync({ alter: true });
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
});
