import 'package:get/get.dart';

import 'update_address_controller.dart';

class UpdateAddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateAddressController>(() => UpdateAddressController());
  }
}
