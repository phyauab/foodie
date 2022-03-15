class Address {
  Address(
      {required this.id,
      required this.name,
      required this.room,
      required this.floor,
      required this.building,
      required this.street,
      required this.district});

  final int id;
  final String name;
  final String room;
  final String floor;
  final String building;
  final String street;
  final String district;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      name: json['name'],
      room: json['room'],
      floor: json['floor'],
      building: json['building'],
      street: json['street'],
      district: json['district'],
    );
  }
}
