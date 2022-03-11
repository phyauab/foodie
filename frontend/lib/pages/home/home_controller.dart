import 'package:flutter/material.dart';
import 'package:frontend/pages/food_items/food_items_controller.dart';
import 'package:frontend/providers/food_items_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final PageController pageController = PageController();
  final _foodItemsProvider = Get.put(FoodItemsProvider());
  var selectedTabIndex = 0.obs;

  void switchTab(int index, bool isFromBot) {
    selectedTabIndex.value = index;
    if (isFromBot) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  Future fetchPopularFoodItems() async {
    return _foodItemsProvider.fetchPopularFoodItems();
  }
}
