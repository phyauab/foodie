const express = require("express");

const app = express();

// routers
const userRouter = require("./routers/user");
const categoryRouter = require("./routers/category");
const foodRouter = require("./routers/food");
const cartItemRouter = require("./routers/cartItem");

app.use(express.json());
app.use(userRouter);
app.use(categoryRouter);
app.use(foodRouter);
app.use(cartItemRouter);

module.exports = app;
