const express = require("express");

const app = express();

// routers
const userRouter = require("./routers/user");
const categoryRouter = require("./routers/category");
const foodRouter = require("./routers/food");
const cartItemRouter = require("./routers/cartItem");
const transactionRouter = require("./routers/transaction");
const locationRouter = require("./routers/location");
const restaurantRouter = require("./routers/restaurant");
const addressRouter = require("./routers/address");

app.use(express.json());
app.use(userRouter);
app.use(categoryRouter);
app.use(foodRouter);
app.use(cartItemRouter);
app.use(transactionRouter);
app.use(locationRouter);
app.use(restaurantRouter);
app.use(addressRouter);

module.exports = app;
