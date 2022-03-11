import 'food_item.dart';

class CartItem {
  CartItem({required this.id, required this.amount, required this.food});

  final int id;
  int amount;
  final FoodItem food;

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
        id: json['id'],
        amount: json['amount'],
        food: FoodItem.fromJson(json['Food']));
  }
}
