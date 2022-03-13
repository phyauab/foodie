import 'package:flutter/material.dart';
import 'package:frontend/components/home/food_card.dart';
import 'package:frontend/components/loading.dart';
import 'package:frontend/components/section_header.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/models/food_item.dart';

class PopularFoodItems extends StatelessWidget {
  const PopularFoodItems({Key? key, required this.fetchPopularFoodItems})
      : super(key: key);

  final Future<Object?> fetchPopularFoodItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionHeader(title: "Popular Now"),
                Text(
                  "Top Items",
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 240,
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => FoodCard(
                          foodItem: snapshot.data[index],
                        ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                          width: 0,
                        ),
                    itemCount: snapshot.data.length);
              } else if (snapshot.hasError) {
                return const Text("something has gone wrong");
              } else {
                return const Loading();
              }
            },
            future: fetchPopularFoodItems,
          ),
        ),
      ],
    );
  }
}
