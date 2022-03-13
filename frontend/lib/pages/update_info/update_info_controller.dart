import 'package:flutter/material.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:get/get.dart';

class UpdateInfoController extends GetxController {
  final _userController = Get.put(UserController());
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  var currentPasswordValidator = true.obs;
  var newPasswordValidator = true.obs;

  Future<void> updateUserInfo() async {
    if (!validateInput()) return;
    bool isSuccess = await _userController.updateInfo(
      _userController.user.value!.id,
      currentPasswordController.text,
      newPasswordController.text,
    );
    if (isSuccess) {
      Get.back();
    }
  }

  bool validateInput() {
    currentPasswordValidator.value = true;
    newPasswordValidator.value = true;
    if (currentPasswordController.text == "") {
      currentPasswordValidator.value = false;
      return false;
    }
    if (newPasswordController.text == "") {
      newPasswordValidator.value = false;
      return false;
    }
    return true;
  }
}
