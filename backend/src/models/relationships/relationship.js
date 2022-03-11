const Category = require("../category");
const Food = require("../food");
const User = require("../user");
const CartItem = require("../cartItem");
const Transaction = require("../transaction");
const sequelize = require("../../db/sequelize");

function defineRelationships() {
  Category.belongsToMany(Food, { through: "Food_Categories" });
  Food.belongsToMany(Category, { through: "Food_Categories" });

  // Cart
  User.hasMany(CartItem);
  CartItem.belongsTo(User);
  // CartItem.hasOne(Food);
  // const CartItem_Food = sequelize.define(
  //   "CartItem_Food",
  //   {},
  //   { timestamps: false }
  // );
  // Food.belongsToMany(CartItem, { through: CartItem_Food });

  Food.hasMany(CartItem);
  CartItem.belongsTo(Food);

  // transaction
  User.hasMany(Transaction);
  Transaction.belongsTo(User);
}

module.exports = defineRelationships;
