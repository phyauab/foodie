import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

import '../../models/address.dart';

class AddressController extends GetxController with StateMixin<List<Address>> {
  final _userProvider = Get.put(UserProvider());
  List<Address> addresses = <Address>[].obs;
  var numOfAddress = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    change(addresses, status: RxStatus.loading());
    addresses = await _userProvider.fetchAddresses();
    if (addresses.isNotEmpty) {
      _updateNumOfAddress();
      change(addresses, status: RxStatus.success());
    } else {
      change(addresses, status: RxStatus.empty());
    }
  }

  void _updateNumOfAddress() {
    print("_updateNumOfAddress: ${addresses.length}");
    numOfAddress.value = addresses.length;
  }
}
