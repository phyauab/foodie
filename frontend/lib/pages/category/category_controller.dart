import 'package:frontend/providers/category_provider.dart';
import 'package:get/get.dart';

import '../../models/category.dart';

class CategoryController extends GetxController
    with StateMixin<List<Category>> {
  final String title = 'Category';
  final _categoryProvider = Get.put(CategoryProvider());
  List<Category> categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    change(categories, status: RxStatus.loading());
    categories = await _categoryProvider.fetchCategories();
    if (categories.isEmpty) {
      change(categories, status: RxStatus.empty());
    } else {
      change(categories, status: RxStatus.success());
    }
  }
}
