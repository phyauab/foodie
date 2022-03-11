import 'package:flutter/material.dart';
import 'package:frontend/components/counter.dart';
import 'package:frontend/helpers/helper.dart';

import '../../constants.dart';
import '../../models/cart_item.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile(
      {Key? key,
      required this.cartItem,
      required this.deleteItem,
      required this.updateQuantity})
      : super(key: key);

  final CartItem cartItem;
  final Function deleteItem;
  final Function updateQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) => Counter(
            id: cartItem.id,
            quantity: cartItem.amount,
            updateQuantity: updateQuantity,
          ),
        ),
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
            Text(
              "\$${(cartItem.amount * cartItem.food.price).toStringAsFixed(1)}",
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
          onPressed: () {
            deleteItem(cartItem.id);
          },
        ),
      ),
    );
  }
}
