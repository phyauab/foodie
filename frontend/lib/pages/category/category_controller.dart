import 'package:frontend/providers/category_provider.dart';
import 'package:get/get.dart';

import '../../models/category.dart';

class CategoryController extends GetxController
    with StateMixin<List<Category>> {
  final String title = 'Category';
  static CategoryController get to => Get.find();
  final _categoryProvider = Get.put(CategoryProvider());

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    RxStatus status = RxStatus.loading();
    change(_categoryProvider.getCategories(), status: status);
    await _categoryProvider.fetchCategories().then((value) => {
          status = _categoryProvider.categories.isEmpty
              ? RxStatus.empty()
              : RxStatus.success()
        });
    change(_categoryProvider.getCategories(), status: RxStatus.success());
  }

  List<Category> getCategories() {
    return _categoryProvider.getCategories();
  }

  Future<void> refreshCategories() async {
    fetch();
  }
}
