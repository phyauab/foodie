const express = require("express");
const router = new express.Router();
const CartItem = require("../models/cartItem");
const User = require("../models/user");
const Food = require("../models/food");
const Category = require("../models/category");

// Create
router.post("/cartItems", async (req, res) => {
  try {
    const user = await User.findOne({
      where: {
        id: req.body.userId,
      },
    });

    if (user == null) {
      throw "Error: user not found";
    }

    console.log("userfound");

    const food = await Food.findOne({
      where: {
        id: req.body.foodId,
      },
    });

    if (food == null) {
      throw "Error: food item not found";
    }
    console.log("food found");

    const cartItem = await CartItem.create({
      amount: req.body.amount,
    });

    cartItem.setUser(user);
    cartItem.setFood(food);

    res.send(cartItem);
  } catch (e) {
    res.status(400).send(e);
  }
});

// Read
router.get("/cartItems", async (req, res) => {
  try {
    // console.log("hiiiiiiiiiiiiiiii");
    const cartItem = await CartItem.findAll({
      include: [{ model: User }, { model: Food }],
    });
    res.send(cartItem);
  } catch (e) {
    res.status.send(e);
  }
});

router.get("/cartItems/user/:id", async (req, res) => {
  try {
    const cartItems = await CartItem.findAll({
      include: [
        {
          model: User,
          where: {
            id: req.params.id,
          },
        },
        {
          model: Food,
          include: Category,
        },
      ],
    });

    res.send(cartItems);
  } catch (e) {
    res.status(400).send(e);
  }
});

// Delete

router.delete("/cartItems/deleteAll", async (req, res) => {
  try {
    const cartItem = await CartItem.destroy({
      where: {},
      truncate: { cascade: true },
    });
    res.send("success");
  } catch (e) {
    res.status(400).send(e);
  }
});

router.delete("/cartItems/:id", async (req, res) => {
  const cartItem = await CartItem.destroy({});
});

module.exports = router;
