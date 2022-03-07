import 'package:frontend/models/user.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final userProvider = Get.put(UserProvider());

  @override
  void onInit() {
    super.onInit();
  }
}
