import 'package:frontend/models/category.dart';
import 'package:frontend/providers/base.dart';

class CategoryProvider extends BaseProvider {
  Future<List<Category>> fetchCategories() async {
    var response = await get('categories');
    if (response.statusCode == 200) {
      return (response.body as List<dynamic>)
          .map((c) => Category.fromJson(c))
          .toList();
    } else {
      return [];
    }
  }
}
