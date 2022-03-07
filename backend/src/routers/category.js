const express = require("express");
const router = new express.Router();
var randomColor = require("randomcolor");
const Category = require("../models/category");
const Food = require("../models/food");

// create
router.post("/categories/add", async (req, res) => {
  try {
    const color = randomColor().replace("#", "");
    req.body.color = color;
    const category = await Category.create(req.body);

    res.send(category);
  } catch (e) {
    res.status(400).send(e);
  }
});

// read
// read 1 or more categories
router.get("/categories", async (req, res) => {
  try {
    let filter = {};
    if (req.body.id) {
      filter = { id: req.body.id };
    }

    const categoryList = await Category.findAll({ where: filter });
    res.send(categoryList);
  } catch (e) {
    res.status.send(e);
  }
});

// update
router.put("/categories/:id", async (req, res) => {
  try {
    const category = await Category.update(req.body, {
      where: {
        id: req.params.id,
      },
    });

    res.send(category);
  } catch (e) {
    res.status(400).send(e);
  }
});

module.exports = router;
