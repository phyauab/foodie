import 'package:flutter/material.dart';
import 'package:frontend/components/address/address_list.dart';
import 'package:frontend/components/common/loading.dart';
import 'package:frontend/components/common/section_header.dart';
import 'package:frontend/components/common/simple_appbar.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/pages/address/address_controller.dart';
import 'package:get/get.dart';

class AddressPage extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: SimpleAppbar(
        title: "My Addresses",
        backgroundColor: Colors.orange[300]!,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAddressesHeader(context),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
            child: const SectionHeader(title: "Addresses"),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildAddressList(context),
        ],
      ),
    );
  }

  Widget _buildAddressesHeader(BuildContext context) {
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
            "Addresses",
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Text(
              "${controller.numOfAddress}",
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
              Get.toNamed("/addAddress");
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text(
              "Add Address",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressList(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: controller.fetchAddresses,
        child: controller.obx(
          (state) => Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
            child: AddressList(addresses: controller.addresses),
          ),
          onLoading: const Loading(),
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
