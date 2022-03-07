import 'package:frontend/models/food_item.dart';
import 'package:frontend/providers/base.dart';

class FoodItemsProvider extends BaseProvider {
  List<FoodItem> foodItems = <FoodItem>[];

  Future<void> fetchFoodItems(int id) async {
    Map<String, dynamic> body = {
      "categories": [id]
    };

    var response = await post('food/getByCategory', body);

    if (response.statusCode == 200) {
      foodItems = (response.body as List<dynamic>)
          .map((c) => FoodItem.fromJson(c))
          .toList();
    }
  }

  List<FoodItem> getFoodItems() {
    return foodItems;
  }

  FoodItem getFoodItem(int id) {
    return foodItems.firstWhere((foodItem) => foodItem.id == id);
  }
}
