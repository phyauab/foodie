import 'package:flutter/material.dart';
import 'package:frontend/models/cart_item.dart';
import 'package:frontend/models/transaction.dart';

import '../../constants.dart';
import '../../helpers/helper.dart';

class OrderRecordTile extends StatelessWidget {
  const OrderRecordTile({Key? key, required this.cartItem}) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      tileColor: Colors.grey.shade100,
      leading: SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          cartItem.food.imagePath,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(capitalize(cartItem.food.name)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quantity: ${cartItem.amount}"),
          Text("${cartItem.updatedAt.toLocal()}"),
        ],
      ),
      isThreeLine: true,
      trailing: Text(
        "\$${(cartItem.amount * cartItem.food.price).toStringAsFixed(1)}",
        style: const TextStyle(color: Colors.green),
      ),
    );
  }
}
