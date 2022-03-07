import 'package:frontend/models/category.dart';

class FoodItem {
  final int id;
  final String name;
  final double price;
  final double rating;
  final String imagePath;
  final List<Category> categories;

  FoodItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.rating,
      required this.imagePath,
      required this.categories});

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      imagePath: json['imagePath'],
      categories: List<Category>.from(
          json["Categories"].map((x) => Category.fromJson(x))),
    );
  }
}
