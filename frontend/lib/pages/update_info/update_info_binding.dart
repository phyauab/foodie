import 'package:frontend/pages/update_info/update_info_controller.dart';
import 'package:get/get.dart';

class UpdateInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateInfoController>(() => UpdateInfoController());
  }
}
