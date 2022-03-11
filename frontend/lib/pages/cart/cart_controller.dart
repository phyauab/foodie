import 'package:frontend/models/cart_item.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:get/get.dart';

class CartController extends GetxController with StateMixin<List<CartItem>> {
  final _cartProvider = Get.put(CartProvider());
  List<CartItem> cartItems = <CartItem>[].obs;
  var total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    change(cartItems, status: RxStatus.loading());
    cartItems = await _cartProvider.fetchCart();
    if (cartItems.isEmpty) {
      change(cartItems, status: RxStatus.empty());
    } else {
      change(cartItems, status: RxStatus.success());
    }
    _calculateTotal();
  }

  Future<void> removeCartItem(int id) async {
    change(cartItems, status: RxStatus.loading());
    bool isSuccess = await _cartProvider.removeCartItem(id);
    if (isSuccess) {
      cartItems.removeWhere((item) => item.id == id);
      _calculateTotal();
      if (cartItems.isEmpty) {
        change(cartItems, status: RxStatus.empty());
      } else {
        change(cartItems, status: RxStatus.success());
      }
    } else {
      change(cartItems, status: RxStatus.success());
    }
  }

  void _calculateTotal() {
    total.value = 0.0;
    for (CartItem cartItem in cartItems) {
      total.value += cartItem.food.price * cartItem.amount;
    }
  }
}
