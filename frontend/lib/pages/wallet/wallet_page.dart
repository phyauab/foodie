import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/common/section_header.dart';
import 'package:frontend/components/common/simple_appbar.dart';
import 'package:frontend/components/wallet/transaction_list.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/pages/add_balance/add_balance_page.dart';
import 'package:get/get.dart';

import 'wallet_controller.dart';

class WalletPage extends GetView<WalletController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: SimpleAppbar(
        title: "My Wallet",
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
            child: const SectionHeader(title: "Transactions"),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildTransactionList(context),
        ],
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
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Balance",
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Text(
              "\$${controller.userController.user.value?.balance.toStringAsFixed(2)}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
                primary: Colors.green),
            onPressed: () {
              Get.toNamed("/addBalance");
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text(
              "Add Balance",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: controller.fetchTransactions,
        child: controller.obx(
          (state) => Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
            child: TransactionList(transactions: controller.transactions),
          ),
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
}
