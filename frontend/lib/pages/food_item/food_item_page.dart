import 'package:flutter/material.dart';
import 'package:frontend/components/common/loading.dart';

import 'package:frontend/components/common/long_button.dart';
import 'package:frontend/components/common/section_header.dart';
import 'package:frontend/components/food_item/cartegory_chips.dart';
import 'package:frontend/components/food_item/embedded_map.dart';
import 'package:frontend/components/food_item/info_row.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/helpers/helper.dart';
import 'package:frontend/pages/cart/cart_controller.dart';
import 'package:frontend/pages/food_item/food_item_controller.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class FoodItemPage extends GetView<FoodItemController> {
  const FoodItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   appBar: _buildAppbar(context),
    //   body: SingleChildScrollView(
    //     child: controller.obx(
    //       (state) => _buildDetail(context),
    //       onLoading: const Loading(),
    //       onEmpty: ListView(
    //         children: const [
    //           Padding(
    //             padding: EdgeInsets.all(20),
    //             child: Center(
    //               child: Text('No categories found, pull to refresh...'),
    //             ),
    //           ),
    //         ],
    //       ),
    //       onError: (error) => ListView(
    //         children: const [
    //           Padding(
    //             padding: EdgeInsets.all(20),
    //             child: Center(
    //               child: Text('An error occured, pull to refresh...'),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      body: controller.obx(
        (state) => _buildBody(context),
        onLoading: const Loading(),
        onEmpty: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text('No categories found, pull to refresh...'),
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
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: false,
          snap: false,
          expandedHeight: 270.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image(
              image: NetworkImage(
                controller.foodItem.value!.imagePath,
              ),
              fit: BoxFit.fitWidth,
              filterQuality: FilterQuality.high,
            ),
            stretchModes: [StretchMode.zoomBackground],
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(capitalize(controller.foodItem.value!.name),
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.w500)),
                          // restaurant
                          Row(
                            children: [
                              const Icon(Icons.restaurant,
                                  color: Colors.grey, size: 14),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                controller.foodItem.value!.restaurant != null
                                    ? controller
                                        .foodItem.value!.restaurant!.name
                                    : 'Foodie',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "\$${controller.foodItem.value!.price.toString()}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CategoryChips(
                      categories: controller.foodItem.value!.categories),
                  const SizedBox(
                    height: 15,
                  ),
                  InfoRow(
                    rating: controller.foodItem.value!.rating,
                    minCookingTime: controller.foodItem.value!.minCookingTime,
                    maxCookingTime: controller.foodItem.value!.maxCookingTime,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SectionHeader(title: "Description"),
                  const SizedBox(
                    height: 15,
                  ),
                  ReadMoreText(
                    controller.foodItem.value!.description,
                    trimLines: 3,
                    style: const TextStyle(color: Colors.black, height: 1.5),
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  if (controller.foodItem.value!.restaurant != null) ...[
                    const SizedBox(
                      height: 15,
                    ),
                    const SectionHeader(title: "Location"),
                    const SizedBox(
                      height: 15,
                    ),
                    EmbededMap(
                      latitude: controller
                          .foodItem.value!.restaurant!.location.latitude,
                      longitude: controller
                          .foodItem.value!.restaurant!.location.longitude,
                    )
                  ],
                  const SizedBox(
                    height: 15,
                  ),
                  _buildCounter(context),
                  const SizedBox(
                    height: 15,
                  ),
                  LongButton(
                      text: 'Add To Cart',
                      icon: Icons.shopping_cart,
                      func: () {
                        controller.addToCart();
                        const snackBar = SnackBar(
                          content: Text('Item added!'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        final cartController = Get.put(CartController());
                        cartController.fetchCartItems();
                        Get.back();
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(defaultBorderRadius)),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              controller.quantity++;
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Obx(
            () => Text(
              controller.quantity.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (controller.quantity.value == 1) {
                return;
              }
              controller.quantity--;
            },
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
