import 'package:flutter/material.dart';
import 'package:frontend/components/common/custom_appbar.dart';
import 'package:frontend/components/common/custom_bottom_navigation_bar.dart';
import 'package:frontend/components/common/custom_drawer.dart';
import 'package:frontend/components/home/carousel.dart';
import 'package:frontend/components/home/popular.dart';
import 'package:frontend/components/home/welcome_message.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/pages/cart/cart_controller.dart';
import 'package:frontend/pages/cart/cart_page.dart';
import 'package:frontend/pages/category/category_controller.dart';
import 'package:frontend/pages/category/category_page.dart';
import 'package:frontend/pages/home/home_controller.dart';
import 'package:frontend/pages/profile/profile_controller.dart';
import 'package:frontend/providers/app_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../components/common/section_header.dart';
import '../profile/profile_page.dart';

class HomePage extends GetView<HomeController> {
  final appProvider = Get.put(AppProvider());
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ProfileController());
    return Scaffold(
      key: appProvider.scaffoldKey,
      appBar: const MainAppbar(),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.switchTab(index, false);
        },
        children: <Widget>[
          _buildHomeBody(context),
          const CategoryPage(),
          CartPage(),
          ProfilePage(),
        ],
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: Obx(
        (() => CustomBottomNavigationBar(
              selectedTabIndex: controller.selectedTabIndex.value,
              switchTab: controller.switchTab,
            )),
      ),
    );
  }

  Widget _buildHomeBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeMessage(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 12, horizontal: defaultScreenPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionHeader(title: "Promotion"),
                Text(
                  "Discounts!",
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
          const Carousel(),
          const SizedBox(
            height: 20,
          ),
          PopularFoodItems(
              fetchPopularFoodItems: controller.fetchPopularFoodItems()),
          // const SizedBox(
          //   height: 20,
          // ),
        ],
      ),
    );
  }
}
