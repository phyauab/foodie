import 'package:flutter/material.dart';
import 'package:frontend/components/profile/info.dart';
import 'package:frontend/components/profile/menu.dart';
import 'package:frontend/components/profile/menu_item.dart';
import 'package:frontend/components/profile/redirect.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
      child: Obx(() => showWidget(context)),
    );
  }

  showWidget(BuildContext context) {
    if (controller.userProvider.isLoggedIn.value) {
      return _buildProfile(context);
    } else {
      return const Redirect();
    }
  }

  Widget _buildProfile(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Info(
            username: controller.userProvider.user!.username,
            email: controller.userProvider.user!.email,
            balance: controller.userProvider.user!.balance,
          ),
          const SizedBox(height: 20),
          Menu()
        ],
      ),
    );
  }
}
