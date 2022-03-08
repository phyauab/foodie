import 'dart:convert';

import 'package:frontend/models/cart_item.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/base.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartProvider extends BaseProvider {
  List<CartItem> cartItems = [];
  final userProvider = Get.put(UserProvider());

  Future<void> fetchCart() async {
    if (userProvider.user == null) {
      // return Future.wait([]);
      print("user is null");
      return;
    }

    final response = await get("cartItems/user/${userProvider.user?.id}");

    if (response.statusCode == 200) {
      for (int i = 0; i < response.body.length; ++i) {
        cartItems.add(CartItem.fromJson(response.body[i]));
      }
    }
  }

  Future<bool> addToCart(int foodId, int amount) async {
    if (userProvider.user == null) {
      return false;
    }

    Map<String, int> body = {
      "amount": amount,
      "userId": userProvider.user!.id,
      "foodId": foodId
    };

    final response = await post("cartItems", body);
    if (response.status == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> refresh() async {
    cartItems = [];
    await fetchCart();
  }

  Future<void> removeCartItem(int id) async {
    final response = await delete("cartItems/$id");
    if (response.statusCode == 200) {
      await refresh();
    }
  }
}
