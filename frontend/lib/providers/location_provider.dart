import 'package:frontend/models/location.dart';

import 'base.dart';

class LocationProvider extends BaseProvider {
  Future<List<Location>> fetchLocations() async {
    final response = await get("users/locations");
    if (response.status.code == 200) {
      return (response.body as List<dynamic>)
          .map((c) => Location.fromJson(c))
          .toList();
    }
    return [];
  }
}
