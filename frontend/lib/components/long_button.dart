import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class LongButton extends StatelessWidget {
  const LongButton(
      {Key? key, required this.text, required this.icon, required this.func})
      : super(key: key);

  final String text;
  final IconData icon;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
            ),
          ),
        ),
        onPressed: () {
          func();
        },
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
