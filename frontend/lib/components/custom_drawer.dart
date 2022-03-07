import 'package:flutter/material.dart';
import 'package:frontend/providers/app_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String name = 'asd';
  double balance = 194.3;
  final userProvider = Get.put(UserProvider());

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
                  CircleAvatar(
                    child: Text(
                      name[0].toUpperCase(),
                      style: const TextStyle(fontSize: 25),
                    ),
                    radius: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    userProvider.user != null
                        ? userProvider.user!.username
                        : 'username',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$$balance',
                    style: const TextStyle(color: Colors.teal),
                  )
                ],
              )),
          ListTile(
            title: const Text('Menu'),
            leading: const Icon(Icons.restaurant_menu),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
