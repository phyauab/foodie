import 'package:frontend/pages/cart/cart_controller.dart';
import 'package:get/get.dart';

import '../../models/address.dart';
import '../../providers/user_provider.dart';

class PaymentController extends GetxController with StateMixin<List<Address>> {
  final _userProvider = Get.put(UserProvider());
  final _cartController = Get.put(CartController());
  var selectedAddress = 0.obs;
  List<Address> addresses = <Address>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    change(addresses, status: RxStatus.loading());
    addresses = await _userProvider.fetchAddresses();
    if (addresses.isNotEmpty) {
      change(addresses, status: RxStatus.success());
    } else {
      change(addresses, status: RxStatus.empty());
    }
  }

  Future<void> makePayment() async {
    return await _cartController.makePayment();
  }

  double getTotal() {
    return _cartController.total.value;
  }
}
