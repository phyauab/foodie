import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _userProvider = Get.put(UserProvider());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var username = "".obs;
  var password = "".obs;
  var email = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> register() async {
    bool isRegisterSuccess = await _userProvider.register(
        username.value, password.value, email.value);
    if (isRegisterSuccess) {
      bool isLoginSuccess =
          await _userProvider.login(username.value, password.value);
      if (isLoginSuccess) {
        return true;
      }
    }
    return false;
  }
}
