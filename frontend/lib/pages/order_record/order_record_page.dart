import 'package:flutter/material.dart';
import 'package:frontend/components/common/simple_appbar.dart';
import 'package:frontend/components/order_record/order_record_list.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/pages/order_record/order_record_controller.dart';
import 'package:get/get.dart';

import '../../components/common/section_header.dart';

class OrderRecordPage extends GetView<OrderRecordController> {
  const OrderRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        title: "Order Records",
        backgroundColor: Colors.orange[300]!,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBalanceHeader(context),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
            child: const SectionHeader(title: "Records"),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildRecordList(context),
        ],
      ),
    );
  }

  Widget _buildRecordList(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: controller.fetch,
        child: controller.obx(
          (state) => Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
              child: OrderRecordList(
                orderRecords: controller.orderRecords,
              )),
          onLoading: const CircularProgressIndicator(
            semanticsLabel: 'Fetching',
          ),
          onEmpty: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text('No items found, pull to refresh...'),
                ),
              ),
            ],
          ),
          onError: (error) => ListView(
            children: const [
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text('An error occured, pull to refresh...'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(defaultBorderRadius),
          bottomRight: Radius.circular(defaultBorderRadius),
        ),
      ),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Number of orders",
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Text(
              "${controller.numOfOrders}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
