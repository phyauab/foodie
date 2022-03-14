import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class MyMap extends StatelessWidget {
  const MyMap({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final double latitude;
  final double longitude;

  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(latitude, longitude),
        zoom: 18.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(latitude, longitude),
              builder: (ctx) => const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // void getAddress() async {
  //   List<Placemark> p1 = await placemarkFromCoordinates(22.34262, 114.13362);
  //   Placemark place1 = p1[0];
  //   List<Placemark> p2 = await placemarkFromCoordinates(22.34374, 114.13057);
  //   Placemark place2 = p2[0];
  //   String _currentAddress =
  //       "${place1.name}, ${place1.locality}, ${place1.postalCode}, ${place1.country}";
  //   String _destinationAddress =
  //       "${place2.name}, ${place2.locality}, ${place2.postalCode}, ${place2.country}";
  //   List<Location> startPlacemark = await locationFromAddress(_currentAddress);
  //   List<Location> destinationPlacemark =
  //       await locationFromAddress(_destinationAddress);
  // }
}
