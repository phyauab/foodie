import 'package:flutter/material.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

import '../cart/cart_controller.dart';

class LoginController extends GetxController {
  final _userController = Get.put(UserController());
  final _cartController = Get.put(CartController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var username = "".obs;
  var password = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> login() async {
    await _userController.login(username.value, password.value);
    if (_userController.isLoggedIn.value) {
      _cartController.fetchCartItems();
    }
    return _userController.user.value != null;
  }
}
