import 'package:frontend/providers/cart_provider.dart';
import 'package:get/get.dart';

import '../../models/food_item.dart';
import '../../providers/food_items_provider.dart';

class FoodItemController extends GetxController with StateMixin<FoodItem> {
  static FoodItemController get to => Get.find();
  final foodItemsProvider = Get.put(FoodItemsProvider());
  final cartProvider = Get.put(CartProvider());
  late FoodItem foodItem;
  var totalAmount = 0.0.obs;
  var quantity = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() {
    RxStatus status = RxStatus.loading();
    // change(foodItem, status: status);
    foodItem =
        foodItemsProvider.getFoodItem(int.parse(Get.parameters["id"] ?? '0'));
    if (foodItem != null) {
      status = RxStatus.success();
      totalAmount = RxDouble(foodItem.price);
      change(foodItem, status: status);
    }
  }

  void addToCart() async {
    cartProvider.addToCart(foodItem.id, quantity.value);
  }
}
