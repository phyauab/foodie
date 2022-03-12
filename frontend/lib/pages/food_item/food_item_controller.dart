import 'package:frontend/pages/cart/cart_controller.dart';
import 'package:frontend/pages/food_items/food_items_controller.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:get/get.dart';
import '../../models/food_item.dart';
import '../../providers/food_items_provider.dart';

class FoodItemController extends GetxController with StateMixin<FoodItem> {
  static FoodItemController get to => Get.find();
  final _foodItemsProvider = Get.put(FoodItemsProvider());
  final _cartProvider = Get.put(CartProvider());
  final _cartController = Get.put(CartController());
  Rx<FoodItem?> foodItem = Rxn<FoodItem>();
  var quantity = 1.obs;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  void fetch() async {
    foodItem.value = await _foodItemsProvider
        .fetchFoodItem(int.parse(Get.parameters["id"] ?? '0'));

    change(foodItem.value, status: RxStatus.loading());
    if (foodItem.value != null) {
      change(foodItem.value, status: RxStatus.success());
    } else {
      change(foodItem.value, status: RxStatus.error());
    }
  }

  void addToCart() async {
    _cartProvider.addToCart(foodItem.value!.id, quantity.value);
    _cartController.fetchCartItems();
  }
}
