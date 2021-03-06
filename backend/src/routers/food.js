const express = require("express");
const router = new express.Router();
const Food = require("../models/food");
const Category = require("../models/category");
const Restaurant = require("../models/restaurant");
const Location = require("../models/location");
const { Op } = require("sequelize");

// Create
router.post("/food", async (req, res) => {
  try {
    const food = await Food.create({
      name: req.body.name,
      price: req.body.price,
      imagePath: req.body.imagePath,
    });

    // get category
    let categoryId = [];
    if (req.body.category) {
      categoryId = req.body.category;
    }
    const category = await Category.findAll({ where: { id: categoryId } });
    await food.addCategory(category);
    res.send("success");
  } catch (e) {
    res.status(400).send(e);
  }
});

// Read
router.get("/food?", async (req, res) => {
  try {
    let filter = {};
    if (req.query) {
      if (req.query.popular) {
        // since req.body.popular is string, so it needs to be converted to boolean
        filter.popular = Boolean(req.query.popular);
      }
    }
    const food = await Food.findAll({
      where: filter,
      include: [Category],
    });
    res.send(food);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.get("/food/:id", async (req, res) => {
  try {
    const food = await Food.findOne({
      where: { id: req.params.id },
      include: [Category, { model: Restaurant, include: [Location] }],
    });
    if (food == null) {
      throw "Error: item not found";
    }
    res.send(food);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.get("/food/:id/price", async (req, res) => {
  try {
    console.log(req.params.id);
    const food = await Food.findOne({
      attributes: ["price"],
      where: {
        id: req.params.id,
      },
    });

    if (food == null) {
      throw "Error: item not found";
    }

    res.send(food);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.post("/food/getByCategory", async (req, res) => {
  try {
    let filter = [];
    if (req.body.categories) {
      for (let i = 0; i < req.body.categories.length; ++i) {
        filter.push({ id: req.body.categories[i] });
      }

      // filter = req.body.categories;
    }

    const food = await Food.findAll({
      include: [
        {
          model: Category,
          required: true,
          where: { [Op.or]: filter },
        },
        {
          model: Restaurant,
          include: [Location],
        },
      ],
    });

    if (food == null) throw "error";

    res.send(food);
  } catch (e) {
    res.status(400).send(e);
  }
});

// Update
router.put("/food/:id", async (req, res) => {
  try {
  } catch (e) {}
});

// Delete
router.delete("/food", async (req, res) => {
  try {
    let filter = [];
    if (req.body.id) {
      filter = req.body.id;
    }
    const food = await Food.destroy({ where: { id: filter } });
    res.send(food);
  } catch (e) {
    res.status(400).send(e);
  }
});

module.exports = router;
