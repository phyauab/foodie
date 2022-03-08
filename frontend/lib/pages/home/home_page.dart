import 'package:flutter/material.dart';
import 'package:frontend/components/custom_appbar.dart';
import 'package:frontend/components/custom_bottom_navigation_bar.dart';
import 'package:frontend/components/custom_drawer.dart';
import 'package:frontend/pages/cart/cart_controller.dart';
import 'package:frontend/pages/cart/cart_page.dart';
import 'package:frontend/pages/category/category_controller.dart';
import 'package:frontend/pages/category/category_page.dart';
import 'package:frontend/pages/home/home_controller.dart';
import 'package:frontend/pages/profile/profile_controller.dart';
import 'package:frontend/providers/app_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

import '../profile/profile_page.dart';

class HomePage extends GetView<HomeController> {
  final appProvider = Get.put(AppProvider());
  final userPorvider = Get.put(UserProvider());
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ProfileController());
    return Scaffold(
      key: appProvider.scaffoldKey,
      appBar: const CustomAppbar(),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.switchTab(index, false);
        },
        children: <Widget>[
          _buildHomeBody(),
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

  Widget _buildHomeBody() {
    return Center(
      child: Text("Home"),
    );
  }
}
