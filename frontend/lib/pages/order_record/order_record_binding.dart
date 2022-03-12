import 'package:frontend/pages/order_record/order_record_controller.dart';
import 'package:get/get.dart';

class OrderRecordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRecordController>(() => OrderRecordController());
  }
}
