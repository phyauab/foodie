import 'package:flutter/material.dart';
import 'package:frontend/models/category.dart';

import '../../helpers/helper.dart';

class CategoryChips extends StatelessWidget {
  CategoryChips({Key? key, required this.categories}) : super(key: key);

  List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) =>
              Chip(label: Text(capitalize(categories[i].name))),
          separatorBuilder: (BuildContext context, int i) => const SizedBox(
                width: 10,
              ),
          itemCount: categories.length),
    );
  }
}
