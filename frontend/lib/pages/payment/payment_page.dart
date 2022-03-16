import 'package:flutter/material.dart';
import 'package:frontend/components/cart/purchase_panel.dart';
import 'package:frontend/components/common/loading.dart';
import 'package:frontend/components/common/section_header.dart';
import 'package:frontend/components/common/simple_appbar.dart';
import 'package:frontend/pages/payment/payment_controller.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(title: "Checkout"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultScreenPadding),
            child: const SectionHeader(title: "Pick your destination"),
          ),
          Expanded(
            child: controller.obx(
              (state) => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.addresses.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(
                    () => ListTile(
                      title: Text('${controller.addresses[index].name}'),
                      selected: index == controller.selectedAddress.value,
                      onTap: () {
                        print("clicked ${index}");
                        controller.selectedAddress.value = index;
                      },
                    ),
                  );
                },
              ),
              onEmpty: const Text("You have no addresses"),
              onLoading: const Loading(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PurchasePanel(
              total: controller.getTotal(),
              makePayment: () {
                controller.makePayment();
                final snackBar = SnackBar(
                  content: const Text('Payment successful'),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Get.back();
              },
            ),
          )
        ],
      ),
    );
  }
}
