import 'package:flutter/material.dart';
import 'package:frontend/helpers/helper.dart';

import '../../constants.dart';
import '../../models/cart_item.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({Key? key, required this.cartItem}) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        tileColor: Colors.grey.shade100,
        leading: Image.network(cartItem.food.imagePath),
        title: Text(capitalize(cartItem.food.name)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quantity: ${cartItem.amount}"),
            Text(
              "\$${cartItem.amount * cartItem.food.price}",
              style: const TextStyle(color: Colors.green),
            )
          ],
        ),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
          onPressed: () {},
        ),
        onTap: () {},
      ),
    );
  }
}
