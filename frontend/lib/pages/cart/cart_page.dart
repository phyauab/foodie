import 'package:flutter/material.dart';
import 'package:frontend/components/cart/cart_list.dart';
import 'package:frontend/components/cart/purchase_panel.dart';
import 'package:frontend/components/page_header.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../../providers/user_provider.dart';
import 'cart_controller.dart';

class CartPage extends GetView<CartController> {
  final _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(title: "Cart"),
          if (!_userController.isLoggedIn.value) ...[
            const Expanded(
              child: Center(
                child: Text("Please login in to use shopping cart"),
              ),
            ),
          ] else ...[
            CartList(),
            Obx(
              () => PurchasePanel(
                total: controller.total.value,
                makePayment: controller.isMakePaymentDisabled.value
                    ? null
                    : controller.makePayment,
              ),
            )
          ]
        ],
      ),
    );
  }
}
