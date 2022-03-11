import 'package:flutter/material.dart';
import 'package:frontend/models/food_item.dart';
import 'package:frontend/providers/food_items_provider.dart';
import 'package:get/get.dart';

class FoodItemsController extends GetxController
    with StateMixin<List<FoodItem>> {
  static FoodItemsController get to => Get.find();
  final _foodItemsProvider = Get.put(FoodItemsProvider());
  List<FoodItem> foodItems = <FoodItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
    change(foodItems, status: RxStatus.loading());
    foodItems = await _foodItemsProvider
        .fetchFoodItems(int.parse(Get.parameters["id"] ?? '0'));

    if (foodItems.isEmpty) {
      change(foodItems, status: RxStatus.empty());
    } else {
      change(foodItems, status: RxStatus.success());
    }
  }

  FoodItem getFoodItem(int id) {
    return foodItems.firstWhere((item) => item.id == id);
  }
}
