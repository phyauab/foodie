import 'package:flutter/material.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

import '../cart/cart_controller.dart';

class LoginController extends GetxController {
  final userProvider = Get.put(UserProvider());
  final cartController = Get.put(CartController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var username = "".obs;
  var password = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> login() async {
    await userProvider.login(username.value, password.value);
    if (userProvider.isLoggedIn.value) {
      cartController.fetchCartItems();
    }
    return userProvider.user != null;
  }
}
