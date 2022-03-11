import 'package:flutter/material.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _userController = Get.put(UserController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var username = "".obs;
  var password = "".obs;
  var email = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> register() async {
    bool isRegisterSuccess = await _userController.register(
        username.value, password.value, email.value);
    if (isRegisterSuccess) {
      bool isLoginSuccess =
          await _userController.login(username.value, password.value);
      if (isLoginSuccess) {
        return true;
      }
    }
    return false;
  }
}
