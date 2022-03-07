import 'package:flutter/material.dart';
import 'package:frontend/components/cart/cart_list.dart';
import 'package:frontend/components/page_header.dart';
import 'package:frontend/constants.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';

class CartPage extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [PageHeader(title: "Cart"), CartList()],
      ),
    );
  }
}
