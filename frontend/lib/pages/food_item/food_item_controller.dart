import 'package:frontend/pages/cart/cart_controller.dart';
import 'package:frontend/pages/food_items/food_items_controller.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:get/get.dart';
import '../../models/food_item.dart';

class FoodItemController extends GetxController with StateMixin<FoodItem> {
  static FoodItemController get to => Get.find();
  final _foodItemsController = Get.put(FoodItemsController());
  final _cartProvider = Get.put(CartProvider());
  final _cartController = Get.put(CartController());
  late FoodItem foodItem;
  var quantity = 1.obs;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  void fetch() {
    foodItem = _foodItemsController
        .getFoodItem(int.parse(Get.parameters["id"] ?? '0'));
    change(foodItem, status: RxStatus.loading());
    if (foodItem != null) {
      change(foodItem, status: RxStatus.success());
    } else {
      change(foodItem, status: RxStatus.error());
    }
  }

  void addToCart() async {
    _cartProvider.addToCart(foodItem.id, quantity.value);
    _cartController.fetchCartItems();
  }
}
