import 'package:flutter/material.dart';
import 'package:frontend/components/loading.dart';

import 'package:frontend/components/long_button.dart';
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
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _buildAppbar(context),
        body: SingleChildScrollView(
          child: controller.obx(
            (state) => _buildDetail(context),
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
        ));
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  SizedBox _buildCategoryChips() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) => Chip(
              label: Text(
                  capitalize(controller.foodItem.value!.categories[i].name))),
          separatorBuilder: (BuildContext context, int i) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.foodItem.value!.categories.length),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Image
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: NetworkImage(
                controller.foodItem.value!.imagePath,
              ),
              fit: BoxFit.fitWidth,
              filterQuality: FilterQuality.high,
            ),
          ),

          // white panel
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: defaultScreenPadding * 2),
                child: SingleChildScrollView(
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
                                      fontSize: 36,
                                      fontWeight: FontWeight.w500)),
                              // restaurant
                              Text(
                                'Good Restaurant',
                                style: Theme.of(context).textTheme.caption,
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
                      _buildCategoryChips(),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildHorizontalInfo(context),
                      const SizedBox(
                        height: 15,
                      ),
                      ReadMoreText(
                        controller.foodItem.value!.description,
                        trimLines: 3,
                        style:
                            const TextStyle(color: Colors.black, height: 1.5),
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        lessStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
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

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

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
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHorizontalInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "${controller.foodItem.value!.rating}/5",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.lock_clock,
              color: Colors.orange,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "${controller.foodItem.value!.minCookingTime} - ${controller.foodItem.value!.maxCookingTime} mins",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
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
