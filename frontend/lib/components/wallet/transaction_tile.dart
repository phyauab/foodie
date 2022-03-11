import 'package:flutter/material.dart';
import 'package:frontend/models/transaction.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({Key? key, required this.transaction})
      : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            transaction.type == "Add Balance"
                ? Icons.keyboard_double_arrow_up
                : Icons.fastfood,
          ),
        ),
        title: Text(transaction.type),
        subtitle: Text(transaction.createdAt.toLocal().toString()),
        trailing: Text(
          "${transaction.type == "Add Balance" ? "+" : "-"} \$${transaction.amount.toString()}",
          style: TextStyle(
            color:
                transaction.type == "Add Balance" ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
