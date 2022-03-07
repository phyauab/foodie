import 'package:flutter/material.dart';
import 'package:frontend/pages/food_item/food_item_controller.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:get/get.dart';

import '../counter.dart';

class PurchasePanel extends StatelessWidget {
  PurchasePanel({Key? key}) : super(key: key);

  final foodItemController = Get.put(FoodItemController());
  final userProvider = Get.put(UserProvider());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Counter(
                      quantity: foodItemController.quantity.value,
                      addQuantity: foodItemController.addQuantity,
                      reduceQuantity: foodItemController.reduceQuantity),
                  Text(
                    '\$${foodItemController.totalAmount.toStringAsFixed(1)}',
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  String notification = userProvider.isLoggedIn.value
                      ? '${foodItemController.quantity} ${foodItemController.foodItem.name} added to your cart'
                      : "Please Login first";

                  final snackBar = SnackBar(
                    content: Text(notification),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  foodItemController.addToCart(foodItemController.foodItem.id,
                      foodItemController.quantity.value);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: const Text(
                  'Add to cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
