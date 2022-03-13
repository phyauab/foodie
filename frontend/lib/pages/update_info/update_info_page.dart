import 'package:flutter/material.dart';
import 'package:frontend/components/common/long_button.dart';
import 'package:frontend/components/common/simple_appbar.dart';
import 'package:frontend/constants.dart';
import 'package:get/get.dart';

import 'update_info_controller.dart';

class UpdateInfoPage extends GetView<UpdateInfoController> {
  const UpdateInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        title: "Update Info",
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                  hintText: "Current Password",
                  errorText: controller.currentPasswordValidator.value
                      ? null
                      : "Please fill this",
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: controller.currentPasswordController,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                hintText: "New Password",
                errorText: controller.newPasswordValidator.value
                    ? null
                    : "Please fill this",
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: controller.newPasswordController,
            ),
            const SizedBox(
              height: 30,
            ),
            LongButton(
              text: "Sumbit",
              icon: Icons.check,
              func: controller.updateUserInfo,
            )
          ],
        ),
      ),
    );
  }
}
