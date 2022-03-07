import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/components/cart_item/purchase_panel.dart';
import 'package:frontend/components/counter.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/helpers/helper.dart';
import 'package:frontend/models/food_item.dart';
import 'package:frontend/pages/food_item/food_item_controller.dart';
import 'package:get/get.dart';

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
            onLoading: const CircularProgressIndicator(
              semanticsLabel: 'Fetching',
            ),
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
              label: Text(capitalize(controller.foodItem.categories[i].name))),
          separatorBuilder: (BuildContext context, int i) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.foodItem.categories.length),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: NetworkImage(
                controller.foodItem.imagePath,
              ),
              fit: BoxFit.fitWidth,
              filterQuality: FilterQuality.high,
            ),
          ),
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
                            Text(capitalize(controller.foodItem.name),
                                style: const TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.w500)),
                            // restaurant
                            Text(
                              'Good Restaurant',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.redAccent,
                            ))
                      ],
                    ),
                    _buildCategoryChips(),
                    RatingBarIndicator(
                      rating: controller.foodItem.rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 25.0,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PurchasePanel()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
