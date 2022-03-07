import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

import 'menu_item.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    List<MenuItem> menuItems = [
      MenuItem(
        iconData: Icons.account_box,
        title: "Details",
        color: Colors.red,
        func: () {},
      ),
      MenuItem(
        iconData: Icons.add,
        title: "Add Balance",
        color: Colors.orange,
        func: () {},
      ),
      MenuItem(
        iconData: Icons.update,
        title: "Update Info",
        color: Colors.blue,
        func: () {},
      ),
      MenuItem(
        iconData: Icons.logout,
        title: "Logout",
        color: Colors.purple,
        func: controller.userProvider.logout,
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
