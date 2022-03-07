import 'package:flutter/material.dart';
import 'package:frontend/providers/app_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  final appProvider = Get.put(AppProvider());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: 'Food',
              style: TextStyle(
                color: Colors.yellow[700],
              ),
            ),
            const TextSpan(text: 'ie'),
          ],
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.grey,
        ),
        onPressed: () {
          appProvider.openDrawer();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
