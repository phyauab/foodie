import 'package:frontend/providers/cart_provider.dart';
import 'package:get/get.dart';

import '../../models/cart_item.dart';

class OrderRecordController extends GetxController
    with StateMixin<List<CartItem>> {
  final _cartProvider = Get.put(CartProvider());
  List<CartItem> orderRecords = <CartItem>[].obs;
  var numOfOrders = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
    change(orderRecords, status: RxStatus.loading());
    orderRecords = await _cartProvider.fetchCart(true);
    if (orderRecords.isNotEmpty) {
      change(orderRecords, status: RxStatus.success());
    } else {
      change(orderRecords, status: RxStatus.empty());
    }
    _updateNumOfOrders();
  }

  void _updateNumOfOrders() {
    numOfOrders.value = orderRecords.length;
  }
}
