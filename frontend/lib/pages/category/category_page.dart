import 'package:flutter/material.dart';
import 'package:frontend/components/page_header.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/models/category.dart';
import 'package:frontend/pages/category/category_controller.dart';
import 'package:get/get.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultScreenPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        PageHeader(title: controller.title),
        Expanded(
          child: RefreshIndicator(
            onRefresh: controller.refreshCategories,
            child: controller.obx(
              (state) => _buildCategoryGridView(context),
              onLoading: const CircularProgressIndicator(
                semanticsLabel: 'Fetching',
              ),
              onEmpty: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text('No categories found, pull to refresh...'),
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
        )
      ]),
    );
  }

  Widget _buildCategoryGridView(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: defaultScreenPadding / 2,
            mainAxisSpacing: defaultScreenPadding / 2,
          ),
          itemCount: controller.getCategories().length,
          itemBuilder: (BuildContext context, int index) {
            return _buildCategoryCard(
                controller.getCategories()[index], context);
          }),
    );
  }

  Card _buildCategoryCard(Category category, BuildContext context) {
    return Card(
        color: category.color.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: InkWell(
          onTap: () {
            Get.toNamed(
                "/food/categories/${category.id}?categoryName=${category.name}");
          },
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        category.color.withOpacity(0.3), BlendMode.dstATop),
                    image: NetworkImage(category.imagePath))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  category.name[0].toUpperCase() +
                      category.name.substring(1, category.name.length),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ));
  }
}
