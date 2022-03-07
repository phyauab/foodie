import 'package:flutter/material.dart';
import 'package:frontend/models/category.dart';
import 'package:frontend/providers/base.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CategoryProvider extends BaseProvider {
  List<Category> categories = <Category>[];

  Future<void> fetchCategories() async {
    var response = await get('categories');

    if (response.statusCode == 200) {
      categories = (response.body as List<dynamic>)
          .map((c) => Category.fromJson(c))
          .toList();
    }
  }

  List<Category> getCategories() {
    return categories;
  }
}
