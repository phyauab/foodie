import 'package:flutter/material.dart';
import '../constants.dart';

class Counter extends StatefulWidget {
  Counter(
      {Key? key,
      required this.id,
      required this.quantity,
      required this.updateQuantity})
      : super(key: key);

  int id;
  int quantity;
  Function updateQuantity;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  void addQuantity() {
    setState(() {
      widget.quantity++;
    });
  }

  void reduceQuantity() {
    if (widget.quantity == 1) return;
    setState(() {
      widget.quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adjust Quantity'),
      content: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        height: 50,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: addQuantity,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            Text(
              widget.quantity.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            IconButton(
              onPressed: reduceQuantity,
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => {
            widget.updateQuantity(widget.id, widget.quantity),
            Navigator.pop(context, 'OK')
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
