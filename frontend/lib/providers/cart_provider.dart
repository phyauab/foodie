import 'dart:convert';

import 'package:frontend/models/cart_item.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/base.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartProvider extends BaseProvider {
  final userProvider = Get.put(UserProvider());

  Future<List<CartItem>> fetchCart() async {
    if (userProvider.user == null) {
      return [];
    }

    final response = await get("cartItems/user/${userProvider.user?.id}");

    if (response.statusCode == 200) {
      return (response.body as List<dynamic>)
          .map((c) => CartItem.fromJson(c))
          .toList();
    }
    return [];
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
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> removeCartItem(int id) async {
    final response = await delete("cartItems/$id");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
