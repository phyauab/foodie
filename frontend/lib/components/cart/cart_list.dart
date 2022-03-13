import 'package:flutter/material.dart';
import 'package:frontend/components/cart/cart_item_tile.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../pages/cart/cart_controller.dart';
import '../common/loading.dart';

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());
  final cartProvider = Get.put(CartProvider());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: cartController.fetchCartItems,
        child: cartController.obx(
          (state) => _buildCartList(context),
          onLoading: const Loading(),
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
          cartItem: cartController.cartItems[index],
          deleteItem: cartController.removeCartItem,
          updateQuantity: cartController.updateQuantity,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: cartController.cartItems.length,
    );
  }
}
