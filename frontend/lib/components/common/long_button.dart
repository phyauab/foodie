import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class LongButton extends StatelessWidget {
  const LongButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.func,
      this.isInverted = false})
      : super(key: key);

  final String text;
  final IconData icon;
  final Function func;
  final bool isInverted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultBorderRadius),
          ),
          color: isInverted ? Colors.white : Theme.of(context).primaryColor),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton.icon(
        // style: ButtonStyle(
        //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //     RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(defaultBorderRadius),
        //     ),
        //   ),
        // ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              side: BorderSide(width: 1, color: Theme.of(context).primaryColor),
            ),
            primary:
                isInverted ? Colors.white : Theme.of(context).primaryColor),
        onPressed: () {
          func();
        },
        icon: Icon(
          icon,
          color: isInverted ? Theme.of(context).primaryColor : Colors.white,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: isInverted ? Theme.of(context).primaryColor : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
