import 'package:flutter/cupertino.dart';

class Category {
  int id;
  String name;
  String imagePath;
  Color color;

  Category(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.color});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name'],
        imagePath: json['imagePath'],
        color: Color(int.parse("0xFF${json['color']}")));
  }
}
