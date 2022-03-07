import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counter extends StatelessWidget {
  const Counter(
      {Key? key,
      required this.quantity,
      required this.addQuantity,
      required this.reduceQuantity})
      : super(key: key);

  final int quantity;
  final VoidCallback addQuantity;
  final VoidCallback reduceQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
        Text('$quantity'),
        IconButton(onPressed: reduceQuantity, icon: const Icon(Icons.remove))
      ],
    );
  }
}
