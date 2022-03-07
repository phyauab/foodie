import 'package:flutter/material.dart';

import '../../constants.dart';

class Info extends StatelessWidget {
  const Info(
      {Key? key,
      required this.username,
      required this.email,
      required this.balance})
      : super(key: key);

  final String username;
  final String email;
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          child: Icon(
            Icons.person,
            size: 50,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                    context,
                    const Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    username),
                const SizedBox(
                  height: 5,
                ),
                _buildInfoRow(
                    context,
                    const Icon(
                      Icons.email,
                      color: Colors.orange,
                    ),
                    email),
                const SizedBox(
                  height: 5,
                ),
                _buildInfoRow(
                    context,
                    const Icon(
                      Icons.attach_money,
                      color: Colors.green,
                    ),
                    "$balance",
                    textColor: Colors.green),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, Icon icon, String text,
      {Color textColor = Colors.grey}) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          const VerticalDivider(
            width: 20,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
