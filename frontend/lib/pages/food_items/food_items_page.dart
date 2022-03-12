import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/page_header.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/helpers/helper.dart';
import 'package:frontend/models/category.dart';
import 'package:frontend/models/food_item.dart';
import 'package:frontend/components/food_item_tile.dart';
import 'package:frontend/pages/food_items/food_items_controller.dart';
import 'package:get/get.dart';

class FoodItemsPage extends GetView<FoodItemsController> {
  const FoodItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
            child: PageHeader(
                title: capitalize(Get.parameters["categoryName"] ?? 'Unknown')),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.fetch,
              child: controller.obx(
                (state) => _buildFoodItemList(context),
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
          )
        ],
      ),
    );
  }

  Widget _buildFoodItemList(BuildContext context) {
    return ListView.builder(
      itemCount: controller.foodItems.length,
      itemBuilder: ((context, index) =>
          FoodItemTile(food: controller.foodItems[index])),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          )),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
