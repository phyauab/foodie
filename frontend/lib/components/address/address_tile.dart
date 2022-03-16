import 'package:flutter/material.dart';
import 'package:frontend/models/address.dart';
import 'package:get/get.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({Key? key, required this.address}) : super(key: key);

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.toNamed("/updateAddress/${address.id}");
        },
        leading: const CircleAvatar(
          child: Icon(
            Icons.location_on,
            color: Colors.red,
          ),
        ),
        title: Text(address.name),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
