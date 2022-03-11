import 'package:frontend/pages/add_balance/add_balance_controller.dart';
import 'package:get/get.dart';

class AddBalanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBalanceController>(() => AddBalanceController());
  }
}
