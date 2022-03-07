import 'package:frontend/pages/cart/cart_controller.dart';
import 'package:frontend/pages/category/category_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}
