import 'package:flutter/material.dart';
import 'package:frontend/components/profile/info.dart';
import 'package:frontend/components/profile/menu.dart';
import 'package:frontend/components/profile/menu_item.dart';
import 'package:frontend/components/profile/redirect.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  final _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
      child: Obx(() => showWidget(context)),
    );
  }

  showWidget(BuildContext context) {
    if (_userController.isLoggedIn.value) {
      return _buildProfile(context);
    } else {
      return const Redirect();
    }
  }

  Widget _buildProfile(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Info(
            username: _userController.user.value!.username,
            email: _userController.user.value!.email,
            balance: _userController.user.value!.balance,
          ),
          const SizedBox(height: 20),
          Menu(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
