import 'package:flutter/material.dart';
import 'package:frontend/components/cart/cart_item_tile.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

import '../../pages/cart/cart_controller.dart';

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  final userProvider = Get.put(UserProvider());
  final cartController = Get.put(CartController());
  final cartProvider = Get.put(CartProvider());

  @override
  Widget build(BuildContext context) {
    if (!userProvider.isLoggedIn.value) {
      return const Expanded(
        child: Center(
          child: Text("Please login first"),
        ),
      );
    }

    return Expanded(
      child: RefreshIndicator(
        onRefresh: cartController.refreshCartItems,
        child: cartController.obx(
          (state) => _buildCartList(context),
          onLoading: const CircularProgressIndicator(
            semanticsLabel: 'Fetching',
          ),
          onEmpty: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text('No items found, please add some'),
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
      ),
    );
  }

  Widget _buildCartList(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return CartItemTile(
            cartItem: cartProvider.cartItems[index],
            deleteItem: cartController.removeCartItem,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: cartProvider.cartItems.length);
  }
}
