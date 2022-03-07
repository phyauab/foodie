import 'package:flutter/material.dart';
import 'package:frontend/pages/food_item/food_item_binding.dart';
import 'package:frontend/pages/food_item/food_item_page.dart';
import 'package:frontend/pages/food_items/food_items_binding.dart';
import 'package:frontend/pages/food_items/food_items_controller.dart';
import 'package:frontend/pages/food_items/food_items_page.dart';
import 'package:frontend/pages/home/home_binding.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:frontend/pages/login/login_binding.dart';
import 'package:frontend/pages/login/login_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo', initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/login",
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/food/categories/:id',
          page: () => const FoodItemsPage(),
          binding: FoodItemsBinding(),
        ),
        GetPage(
            name: '/food/:id',
            page: () => FoodItemPage(),
            binding: FoodItemBinding())
      ],
      // theme: ThemeData(
      //     primarySwatch: Colors.amber,
      //     primaryColor: Colors.yellow[700],
      //     iconTheme: const IconThemeData(color: Colors.grey)),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const HomeScreen(),
      //   '/login': (context) => const LoginScreen(),
      // },
    );
  }
}
