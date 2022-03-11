const express = require("express");
const router = new express.Router();
const auth = require("../middlewares/auth");
const Transaction = require("../models/transaction");
const User = require("../models/user");

// create
router.post("/transactions/addBalance", auth, async (req, res) => {
  try {
    const { amount } = req.body;
    if (amount <= 0) {
      throw new Error("Error: amount must be greater then 0");
    }

    console.log("1");
    const transaction = await Transaction.create({
      amount: amount,
      type: "Add Balance",
    });

    console.log("2");
    if (!transaction) {
      throw new Error("Error: transaction fails");
    }
    console.log("3");

    transaction.setUser(req.user);

    req.user.balance += amount;
    await req.user.save();

    res.send(transaction);
  } catch (e) {
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
