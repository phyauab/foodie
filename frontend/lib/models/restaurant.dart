import 'location.dart';

class Restaurant {
  Restaurant({required this.id, required this.name, required this.location});

  final int id;
  final String name;
  final Location location;

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      location: Location.fromJson(json['Location']),
    );
  }
}
