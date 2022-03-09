import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class PurchasePanel extends StatelessWidget {
  const PurchasePanel({Key? key, required this.total}) : super(key: key);

  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultBorderRadius),
          topRight: Radius.circular(defaultBorderRadius),
        ),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width - defaultScreenPadding * 2,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "\$${total.toString()}",
            style: const TextStyle(
                color: Colors.green, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                ),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.payment,
                color: Colors.white,
              ),
              label: const Text(
                "Pay Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
