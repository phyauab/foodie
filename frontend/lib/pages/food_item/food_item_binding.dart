import 'package:get/get.dart';

import 'food_item_controller.dart';

class FoodItemBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodItemController>(() => FoodItemController());
  }
}
