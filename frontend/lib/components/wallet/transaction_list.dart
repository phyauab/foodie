import 'package:flutter/widgets.dart';
import 'package:frontend/components/wallet/transaction_tile.dart';

import '../../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) => Container(
              child: TransactionTile(transaction: transactions[index]),
            )),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: transactions.length);
  }
}
