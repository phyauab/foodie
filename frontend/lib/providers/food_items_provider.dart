import 'package:frontend/models/food_item.dart';
import 'package:frontend/providers/base.dart';

class FoodItemsProvider extends BaseProvider {
  Future<List<FoodItem>> fetchFoodItems(int id) async {
    Map<String, dynamic> body = {
      "categories": [id]
    };

    var response = await post('food/getByCategory', body);

    if (response.statusCode == 200) {
      return (response.body as List<dynamic>)
          .map((c) => FoodItem.fromJson(c))
          .toList();
    } else {
      return [];
    }
  }

  Future<FoodItem?> fetchFoodItem(int id) async {
    var response = await get('food/$id');
    if (response.statusCode == 200) {
      return FoodItem.fromJson(response.body);
    }
    return null;
  }

  Future fetchPopularFoodItems() async {
    Map<String, dynamic> query = {"popular": "true"};

    var response = await get('food', query: query);
    if (response.statusCode == 200) {
      return (response.body as List<dynamic>)
          .map((c) => FoodItem.fromJson(c))
          .toList();
    }
  }
}
