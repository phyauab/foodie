import 'package:flutter/material.dart';
import 'package:frontend/models/food_item.dart';
import 'package:frontend/providers/food_items_provider.dart';
import 'package:get/get.dart';

class FoodItemsController extends GetxController
    with StateMixin<List<FoodItem>> {
  static FoodItemsController get to => Get.find();
  final foodItemsProvider = Get.put(FoodItemsProvider());

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    RxStatus status = RxStatus.loading();
    change(foodItemsProvider.getFoodItems(), status: status);
    await foodItemsProvider
        .fetchFoodItems(int.parse(Get.parameters["id"] ?? '0'))
        .then((value) => {
              status = foodItemsProvider.getFoodItems().isEmpty
                  ? RxStatus.empty()
                  : RxStatus.success()
            });
    change(foodItemsProvider.getFoodItems(), status: RxStatus.success());
  }

  Future<void> refreshFoodItems() async {
    fetch();
  }
}
