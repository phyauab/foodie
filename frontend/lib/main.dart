import 'package:flutter/material.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/pages/add_address/add_address_binding.dart';
import 'package:frontend/pages/add_address/add_address_page.dart';
import 'package:frontend/pages/add_balance/add_balance_binding.dart';
import 'package:frontend/pages/add_balance/add_balance_page.dart';
import 'package:frontend/pages/address/address_binding.dart';
import 'package:frontend/pages/order_record/order_record_binding.dart';
import 'package:frontend/pages/order_record/order_record_page.dart';
import 'package:frontend/pages/update_address/update_address_binding.dart';
import 'package:frontend/pages/update_address/update_address_page.dart';
import 'package:frontend/pages/update_info/update_info_binding.dart';
import 'package:frontend/pages/update_info/update_info_page.dart';
import 'package:frontend/pages/wallet/wallet_binding.dart';
import 'package:frontend/pages/wallet/wallet_page.dart';
import 'package:frontend/pages/food_item/food_item_binding.dart';
import 'package:frontend/pages/food_item/food_item_page.dart';
import 'package:frontend/pages/food_items/food_items_binding.dart';
import 'package:frontend/pages/food_items/food_items_page.dart';
import 'package:frontend/pages/home/home_binding.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:frontend/pages/login/login_binding.dart';
import 'package:frontend/pages/login/login_screen.dart';
import 'package:frontend/pages/register/register_binding.dart';
import 'package:frontend/pages/register/register_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'pages/address/address_page.dart';

Future main() async {
  await dotenv.load(fileName: "config.env");
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
          name: "/orderRecords",
          page: () => OrderRecordPage(),
          binding: OrderRecordBinding(),
        ),
        GetPage(
          name: "/addBalance",
          page: () => AddBalancePage(),
          binding: AddBalanceBinding(),
        ),
        GetPage(
          name: "/updateInfo",
          page: () => UpdateInfoPage(),
          binding: UpdateInfoBinding(),
        ),
        GetPage(
          name: "/address",
          page: () => AddressPage(),
          binding: AddressBinding(),
        ),
        GetPage(
          name: "/addAddress",
          page: () => AddAddressPage(),
          binding: AddAddressBinding(),
        ),
        GetPage(
          name: "/updateAddress/:id",
          page: () => UpdateAddressPage(),
          binding: UpdateAddressBinding(),
        )
      ],
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.orange[300],
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
