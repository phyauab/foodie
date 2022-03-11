import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/models/cart_item.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

class CartController extends GetxController with StateMixin<List<CartItem>> {
  final _cartProvider = Get.put(CartProvider());
  final _userController = Get.put(UserController());
  List<CartItem> cartItems = <CartItem>[].obs;
  var total = 0.0.obs;
  var isMakePaymentDisabled = false.obs;

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
    _updateIsMakePaymentDisabled();
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
    _updateIsMakePaymentDisabled();
  }

  Future<void> updateQuantity(int id, int quantity) async {
    change(cartItems, status: RxStatus.loading());
    bool isSuccess = await _cartProvider.updateQuantity(id, quantity);
    if (isSuccess) {
      CartItem cartItem = cartItems.firstWhere((item) => item.id == id);
      cartItem.amount = quantity;
      _calculateTotal();
      _updateIsMakePaymentDisabled();

      if (cartItems.isEmpty) {
        change(cartItems, status: RxStatus.empty());
      } else {
        change(cartItems, status: RxStatus.success());
      }
    } else {
      change(cartItems, status: RxStatus.success());
    }
  }

  Future<void> makePayment() async {}

  void _updateIsMakePaymentDisabled() {
    if (_userController.user.value != null) {
      isMakePaymentDisabled.value =
          _userController.user.value!.balance < total.value;
    } else {
      isMakePaymentDisabled.value = true;
    }
  }

  void _calculateTotal() {
    total.value = 0.0;
    for (CartItem cartItem in cartItems) {
      total.value += cartItem.food.price * cartItem.amount;
    }
  }
}
