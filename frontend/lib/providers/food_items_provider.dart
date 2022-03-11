import 'package:frontend/models/food_item.dart';
import 'package:frontend/providers/base.dart';

class FoodItemsProvider extends BaseProvider {
  // List<FoodItem> foodItems = <FoodItem>[];

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
