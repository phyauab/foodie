import 'package:flutter/material.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/pages/add_balance/add_balance_binding.dart';
import 'package:frontend/pages/add_balance/add_balance_page.dart';
import 'package:frontend/pages/wallet/wallet_binding.dart';
import 'package:frontend/pages/wallet/wallet_page.dart';
import 'package:frontend/pages/food_item/food_item_binding.dart';
import 'package:frontend/pages/food_item/food_item_page.dart';
import 'package:frontend/pages/food_items/food_items_binding.dart';
import 'package:frontend/pages/food_items/food_items_controller.dart';
import 'package:frontend/pages/food_items/food_items_page.dart';
import 'package:frontend/pages/home/home_binding.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:frontend/pages/login/login_binding.dart';
import 'package:frontend/pages/login/login_screen.dart';
import 'package:frontend/pages/register/register_binding.dart';
import 'package:frontend/pages/register/register_page.dart';
import 'package:frontend/pages/wallet/wallet_page.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
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
          name: "/register",
          page: () => RegisterPage(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: '/food/categories/:id',
          page: () => const FoodItemsPage(),
          binding: FoodItemsBinding(),
        ),
        GetPage(
          name: '/food/:id',
          page: () => FoodItemPage(),
          binding: FoodItemBinding(),
        ),
        GetPage(
          name: "/wallet",
          page: () => WalletPage(),
          binding: WalletBinding(),
        ),
        GetPage(
          name: "/addBalance",
          page: () => AddBalancePage(),
          binding: AddBalanceBinding(),
        )
      ],
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.yellow[700],
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const HomeScreen(),
      //   '/login': (context) => const LoginScreen(),
      // },
    );
  }
}
