class Location {
  Location(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude});

  final int id;
  final String name;
  final double latitude;
  final double longitude;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
    );
  }
}
