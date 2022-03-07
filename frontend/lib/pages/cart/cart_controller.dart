import 'package:frontend/models/cart_item.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:get/get.dart';

class CartController extends GetxController with StateMixin<List<CartItem>> {
  final cartProvider = Get.put(CartProvider());

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    RxStatus status = RxStatus.loading();
    change(cartProvider.cartItems, status: status);
    await cartProvider.fetchCart().then((value) => {});
    if (cartProvider.cartItems.isEmpty) {
      change(cartProvider.cartItems, status: RxStatus.empty());
    } else {
      change(cartProvider.cartItems, status: RxStatus.success());
    }
  }

  Future<void> refreshCartItems() async {
    change(cartProvider.cartItems, status: RxStatus.loading());
    await cartProvider.refresh();
    change(cartProvider.cartItems, status: RxStatus.success());
  }

  Future<void> removeCartItem(int id) async {
    change(cartProvider.cartItems, status: RxStatus.loading());
    await cartProvider.removeCartItem(id);
    print("success");
    change(cartProvider.cartItems, status: RxStatus.success());
  }
}
