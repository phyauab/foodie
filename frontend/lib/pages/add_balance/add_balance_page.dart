import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/long_button.dart';
import 'package:frontend/constants.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import 'add_balance_controller.dart';

class AddBalancePage extends GetView<AddBalanceController> {
  const AddBalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Center(
                  child: Obx(
                    () => Text(
                      controller.amount.value.length == 0
                          ? "0"
                          : controller.amount.value,
                      style: TextStyle(
                        fontSize: 36,
                        color: controller.amount.value.length == 0
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              LongButton(
                text: "Confirm",
                icon: Icons.check,
                func: controller.addBalance,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: NumericKeyboard(
                  onKeyboardTap: controller.onKeyboardTap,
                  rightButtonFn: controller.delete,
                  rightIcon: const Icon(
                    Icons.backspace,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      leading: null,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text("Add Balance"),
    );
  }
}
