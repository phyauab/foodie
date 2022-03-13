import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/helpers/helper.dart';
import 'package:frontend/models/food_item.dart';
import 'package:get/get.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key, required this.foodItem}) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: defaultScreenPadding, bottom: defaultScreenPadding),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Get.toNamed("/food/${foodItem.id}");
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 150,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius),
                  topRight: Radius.circular(defaultBorderRadius),
                ),
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.network(
                    foodItem.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      capitalize(foodItem.name),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    RatingBarIndicator(
                      rating: foodItem.rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 10.0,
                      direction: Axis.horizontal,
                    ),
                    Text(
                      "\$${foodItem.price.toString()}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
