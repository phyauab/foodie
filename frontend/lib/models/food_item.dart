import 'package:frontend/models/category.dart';

class FoodItem {
  final int id;
  final String name;
  final double price;
  final double rating;
  final String imagePath;
  final int minCookingTime;
  final int maxCookingTime;
  final String description;
  final List<Category> categories;

  FoodItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.rating,
      required this.imagePath,
      required this.minCookingTime,
      required this.maxCookingTime,
      required this.description,
      required this.categories});

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      imagePath: json['imagePath'],
      minCookingTime: json['minCookingTime'],
      maxCookingTime: json['maxCookingTime'],
      description: json['description'],
      categories: List<Category>.from(
          json["Categories"].map((x) => Category.fromJson(x))),
    );
  }
}
