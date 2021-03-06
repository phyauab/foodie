const express = require("express");
const router = new express.Router();
const User = require("../models/user");
const CartItem = require("../models/cartItem");
const Location = require("../models/location");
const Address = require("../models/address");
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

// POST: user address
router.post("/users/addresses", auth, async (req, res) => {
  try {
    const address = await Address.create(req.body);
    if (!address) throw "Error: Create address fails";

    address.setUser(req.user);
    res.send(address);
  } catch (e) {
    res.status(400).send(e);
  }
});

// Read
router.get("/users", async (req, res) => {
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

// GET: user's locations
router.get("/users/locations", auth, async (req, res) => {
  try {
    const locations = await Location.findAll({
      where: { UserId: req.user.id },
    });
    res.send(locations);
  } catch (e) {
    res.send(e);
  }
});

// GET: user's addresses
router.get("/users/addresses", auth, async (req, res) => {
  try {
    const addresses = await Address.findAll({ where: { UserId: req.user.id } });
    res.send(addresses);
  } catch (e) {
    res.status(400).send(e);
  }
});

// GET: user's address
router.get("/users/addresses/:id", auth, async (req, res) => {
  try {
    const address = await Address.findOne({ where: { id: req.params.id } });
    if (!address) throw "Error: Failed to find address";
    res.send(address);
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
router.patch("/users/:id", auth, async (req, res) => {
  try {
    if (req.user.id != req.params.id)
      throw "You are not allowed to modify other users";

    const user = await User.findOne({
      where: {
        id: req.params.id,
      },
    });

    if (user == null) throw "Error: User not found";

    if (user.password != req.body.password) throw "Wrong password";

    if (req.body) {
      if (req.body.newPassword) {
        user.password = req.body.newPassword;
      }
    }

    await user.save();

    return res.send(user);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.patch("/users/addresses/:id", auth, async (req, res) => {
  try {
    const address = await Address.update(req.body, {
      where: { id: req.params.id },
    });
    if (!address) throw "Error: Failed to update address";
    res.send(address);
  } catch (e) {
    res.status(400).send(e);
  }
});

module.exports = router;
