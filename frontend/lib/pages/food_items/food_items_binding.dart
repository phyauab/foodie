import 'package:get/get.dart';

import 'food_items_controller.dart';

class FoodItemsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodItemsController>(() => FoodItemsController());
    // Get.put<Service>(() => Api());
  }
}
