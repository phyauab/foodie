import 'package:flutter/material.dart';

import '../../models/address.dart';
import '../../models/location.dart';
import 'address_tile.dart';

class AddressList extends StatelessWidget {
  const AddressList({Key? key, required this.addresses}) : super(key: key);

  final List<Address> addresses;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => AddressTile(
              address: addresses[index],
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
        itemCount: addresses.length);
  }
}
