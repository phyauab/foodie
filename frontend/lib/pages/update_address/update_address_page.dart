import 'package:flutter/material.dart';
import 'package:frontend/components/common/long_button.dart';
import 'package:frontend/components/common/simple_appbar.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'update_address_controller.dart';

class UpdateAddressPage extends GetView<UpdateAddressController> {
  const UpdateAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(title: "Update Address"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
                controller: controller.nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Room',
                      ),
                      controller: controller.roomController,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Floor',
                      ),
                      controller: controller.floorController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Building',
                ),
                controller: controller.buildingController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Street',
                ),
                controller: controller.streetController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'District',
                ),
                controller: controller.districtController,
              ),
              const SizedBox(
                height: 10,
              ),
              LongButton(
                  text: "Confirm",
                  icon: Icons.check,
                  func: () async {
                    bool isSuccess = await controller.updateAddress();
                    if (isSuccess) {
                      final snackBar = SnackBar(
                        content: const Text('Address updated successfully'),
                        action: SnackBarAction(
                          label: 'I got it',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Get.back();
                      return;
                    }
                    final snackBar = SnackBar(
                      content: const Text('Failed to update address'),
                      action: SnackBarAction(
                        label: 'I got it',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Get.back();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
