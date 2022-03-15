const express = require("express");
const router = new express.Router();
const auth = require("../middlewares/auth");
const Location = require("../models/location");
const User = require("../models/user");

// create
router.post("/locations", auth, async (req, res) => {
  try {
    if (!req.body) throw "Error: Empty body";
    if (!req.body.name) throw "Error: Empty name";
    if (!req.body.latitude) throw "Error: Empty name";
    if (!req.body.longitude) throw "Error: Empty name";

    const location = await Location.create(req.body);

    if (!location) throw "Error: Create location fails";

    location.setUser(req.user);

    res.send(location);
  } catch (e) {
    res.status(400).send(e);
  }
});

// read
router.get("/locations", auth, async (req, res) => {
  try {
    const locations = await Location.findAll();

    res.send(locations);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.get("/locations/:id", auth, async (req, res) => {
  try {
    const location = await Location.create(req.body);

    if (!location) throw "Error: Create location fails";

    location.setUser(req.user);

    res.send(location);
  } catch (e) {
    res.status(400).send(e);
  }
});

// DELETE
router.delete("/locations/:id", auth, async (req, res) => {
  try {
    const location = await Location.destroy({
      where: { id: req.params.id, UserId: req.user.id },
    });
    if (!location) throw "Error: Delete Location Fails";
    res.send("Delete location successfully");
  } catch (e) {
    res.status(400).send(e);
  }
});

module.exports = router;
