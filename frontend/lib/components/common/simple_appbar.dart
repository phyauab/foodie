import 'package:flutter/material.dart';
import 'package:frontend/providers/app_provider.dart';
import 'package:get/get.dart';

class SimpleAppbar extends StatefulWidget implements PreferredSizeWidget {
  SimpleAppbar(
      {Key? key,
      required this.title,
      this.backgroundColor = Colors.transparent})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  final String title;
  Color backgroundColor;

  @override
  State<SimpleAppbar> createState() => _SimpleAppbarState();
}

class _SimpleAppbarState extends State<SimpleAppbar> {
  final appProvider = Get.put(AppProvider());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: widget.backgroundColor == Colors.transparent
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () {
            Get.back();
          }),
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      title: Text(
        widget.title,
        style: TextStyle(
          color: widget.backgroundColor == Colors.transparent
              ? Colors.black
              : Colors.white,
        ),
      ),
    );
  }
}
