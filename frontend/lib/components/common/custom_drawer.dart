import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final _userController = Get.put(UserController());

  final List<DrawerTile> _drawerList = [
    DrawerTile(Icons.library_books, "Records", "orderRecords"),
    DrawerTile(Icons.account_balance_wallet, "My Wallet", "wallet"),
    DrawerTile(Icons.update, "Update Info", "updateInfo")
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.person),
                    radius: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _userController.user.value != null
                        ? _userController.user.value!.username
                        : 'Please Login',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    _userController.user.value != null
                        ? '\$${_userController.user.value!.balance.toString()}'
                        : "\$0.0",
                    style: const TextStyle(color: Colors.teal),
                  )
                ],
              )),
          if (_userController.user.value != null)
            for (DrawerTile item in _drawerList)
              ListTile(
                leading: Icon(item.iconData),
                title: Text(item.title),
                onTap: () {
                  Get.toNamed(item.route);
                },
              )
          else ...[
            ListTile(
              leading: Icon(Icons.login),
              title: Text("Login"),
              onTap: () {
                Get.toNamed("/login");
              },
            )
          ]
        ],
      ),
    );
  }

  List<ListTile> _buildList() {
    return _drawerList
        .map((item) => ListTile(
              leading: Icon(item.iconData),
              title: Text(item.title),
              onTap: () {
                Get.toNamed(item.route);
              },
            ))
        .toList();
  }
}

class DrawerTile {
  DrawerTile(this.iconData, this.title, this.route);

  final IconData iconData;
  final String title;
  final String route;
}
