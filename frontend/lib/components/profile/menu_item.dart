import 'package:flutter/material.dart';

import '../../constants.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.color,
      required this.func})
      : super(key: key);

  final IconData iconData;
  final String title;
  final Color color;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        tileColor: Colors.grey.shade100,
        leading: Icon(
          iconData,
          color: color,
        ),
        title: Text(title),
        onTap: () {
          func();
        },
      ),
    );
  }
}
