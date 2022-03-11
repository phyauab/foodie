const express = require("express");
const router = new express.Router();
const User = require("../models/user");
const CartItem = require("../models/cartItem");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");
const validator = require("validator");
const JWT_PRIVATEKEY = "asdasdasd";

// Create
router.post("/users/register", async (req, res) => {
  try {
    if (!req.body.email || !validator.isEmail(req.body.email))
      throw "Error: Invalid Email";

    console.log("---------PASSWORD---------");
    console.log(req.body.password);

    const user = await User.create(req.body);

    if (user == null) throw "Error: failed to create user";

    res.send(`User ${user.id} is registered`);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.post("/users/login", async (req, res) => {
  try {
    const { username, password } = req.body;
    const user = await User.findOne({
      where: { username: username, password: password },
    });

    if (user == null) throw "Error: login fails";

    const token = jwt.sign({ id: user.id }, JWT_PRIVATEKEY);

    // user = dataValues + _previousValues
    // only dataValues will be returned
    user.dataValues.token = token;
    res.send(user);
  } catch (e) {
    res.status(400).send(e);
  }
});

// Read
router.get("/users/all", async (req, res) => {
  try {
    const users = await User.findAll();
    res.send(users);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.get("/users/getMe", auth, async (req, res) => {
  try {
    res.send(req.user);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.get("/users/:id", auth, async (req, res) => {
  try {
    const user = await User.findOne({ where: { id: req.params.id } });

    if (user == null) throw "Error: User Not Found";

    res.send(user);
  } catch (e) {
    res.status(404).send(e);
  }
});

// update
router.put("/users/:id", async (req, res) => {
  try {
    console.log(req.params.id);
    const user = await User.findOne({
      where: {
        id: req.params.id,
      },
    });

    console.log(user);

    if (user == null) throw "Error: User not found";

    user.set(req.body);
    await user.save();

    return res.send(user);
  } catch (e) {
    res.status(400).send(e);
  }
});

module.exports = router;
