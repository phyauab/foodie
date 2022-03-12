const express = require("express");
const router = new express.Router();
const auth = require("../middlewares/auth");
const Transaction = require("../models/transaction");
const CartItem = require("../models/cartItem");
const Food = require("../models/food");
const User = require("../models/user");

// create
router.post("/transactions/addBalance", auth, async (req, res) => {
  try {
    const { amount } = req.body;
    if (amount <= 0) {
      throw new Error("Error: amount must be greater then 0");
    }

    const transaction = await Transaction.create({
      amount: amount,
      type: "Add Balance",
    });

    if (!transaction) {
      throw new Error("Error: transaction fails");
    }

    transaction.setUser(req.user);

    req.user.balance += amount;
    await req.user.save();

    res.send(transaction);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.post("/transactions/payment", auth, async (req, res) => {
  try {
    console.log(req.user.id);
    const cartItems = await CartItem.findAll({
      where: { UserId: req.user.id, isPaid: false },
      include: [Food],
    });

    if (cartItems.length == 0) throw new Error("Error: Cart is Empty");

    let totalPrice = 0;
    for (let i = 0; i < cartItems.length; ++i) {
      totalPrice += cartItems[i].Food.price * cartItems[i].amount;
    }
    console.log("-----total price--------");
    console.log(totalPrice);

    if (req.user.balance < totalPrice)
      throw new Error("Error: Please make sure your balance is enough");

    // update balance
    req.user.balance -= totalPrice;
    await req.user.save();

    // create transaction
    const transaction = await Transaction.create({
      amount: -totalPrice,
      type: "Order",
    });
    transaction.setUser(req.user);

    // update cartItems status
    for (let i = 0; i < cartItems.length; ++i) {
      cartItems[i].isPaid = true;
      await cartItems[i].save();
    }

    res.send("Payment successful");
  } catch (e) {
    console.log("----------ERROR------------");
    console.log(e);
    res.status(400).send(e);
  }
});

// read
router.get("/transactions", auth, async (req, res) => {
  try {
    const transactions = await Transaction.findAll({
      where: { UserId: req.user.id },
      order: [["createdAt", "DESC"]],
    });
    res.send(transactions);
  } catch (e) {
    res.status(400).send(e);
  }
});

module.exports = router;
