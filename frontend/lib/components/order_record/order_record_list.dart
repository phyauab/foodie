import 'package:flutter/widgets.dart';
import 'package:frontend/models/cart_item.dart';

import 'order_record_tile.dart';

class OrderRecordList extends StatelessWidget {
  const OrderRecordList({Key? key, required this.orderRecords})
      : super(key: key);

  final List<CartItem> orderRecords;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) => Container(
              child: OrderRecordTile(cartItem: orderRecords[index]),
            )),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: orderRecords.length);
  }
}
