import 'food_item.dart';

class CartItem {
  CartItem(
      {required this.id,
      required this.amount,
      required this.food,
      required this.updatedAt});

  final int id;
  final FoodItem food;
  int amount;
  final DateTime updatedAt;

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      amount: json['amount'],
      food: FoodItem.fromJson(json['Food']),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
