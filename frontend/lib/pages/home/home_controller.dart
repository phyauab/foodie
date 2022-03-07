import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final PageController pageController = PageController();

  var selectedTabIndex = 0.obs;

  void switchTab(int index, bool isFromBot) {
    selectedTabIndex.value = index;
    if (isFromBot) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
