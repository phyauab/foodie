import 'package:flutter/material.dart';
import 'package:frontend/components/map/map.dart';

class EmbededMap extends StatelessWidget {
  const EmbededMap({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  final double _height = 200;
  final double _width = 400;
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: MyMap(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }
}
