import 'package:frontend/pages/add_address/add_address_controller.dart';
import 'package:get/get.dart';

class AddAddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAddressController>(() => AddAddressController());
  }
}
