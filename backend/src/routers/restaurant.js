const express = require("express");
const router = new express.Router();
const Restaurant = require("../models/restaurant");
const Location = require("../models/location");

// Create
router.post("/restaurants", async (req, res) => {
  try {
    console.log("hi");
    // create restaurant
    if (!req.body.name) throw "Error: name cannot be empty";
    const restaurant = await Restaurant.create({ name: req.body.name });

    if (!req.body.location.name) throw "Error: Empty name";
    if (!req.body.location.latitude) throw "Error: Empty name";
    if (!req.body.location.longitude) throw "Error: Empty name";

    const location = await Location.create(req.body.location);

    location.setRestaurant(restaurant);
    res.send(restaurant);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.get("/restaurants/:id", async (req, res) => {
  try {
    const restaurant = await Restaurant.findOne({
      where: {
        id: req.params.id,
      },
    });

    if (!restaurant) throw "Error: restaurant not found";

    res.send(restaurant);
  } catch (e) {
    res.status(400).send(e);
  }
});

module.exports = router;
