import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

import 'menu_item.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    final _userController = Get.put(UserController());

    List<MenuItem> menuItems = [
      MenuItem(
        iconData: Icons.library_books,
        title: "Records",
        color: Colors.red,
        func: () {
          Get.toNamed("/orderRecords");
        },
      ),
      MenuItem(
        iconData: Icons.account_balance_wallet,
        title: "My Wallet",
        color: Colors.orange,
        func: () {
          Get.toNamed("/wallet");
        },
      ),
      MenuItem(
        iconData: Icons.update,
        title: "Update Info",
        color: Colors.blue,
        func: () {
          Get.toNamed("/updateInfo");
        },
      ),
      MenuItem(
        iconData: Icons.logout,
        title: "Logout",
        color: Colors.purple,
        func: _userController.logout,
      ),
    ];
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * longButtonToScreenRatio,
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return menuItems[index];
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: menuItems.length),
      ),
    );
  }
}
