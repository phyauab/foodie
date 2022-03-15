import 'package:flutter/material.dart';
import 'package:frontend/models/address.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({Key? key, required this.address}) : super(key: key);

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(
            Icons.location_on,
            color: Colors.red,
          ),
        ),
        title: Text(address.name),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
