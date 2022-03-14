import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow(
      {Key? key,
      required this.rating,
      required this.minCookingTime,
      required this.maxCookingTime})
      : super(key: key);

  final double rating;
  final int minCookingTime;
  final int maxCookingTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "$rating/5",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.lock_clock,
              color: Colors.orange,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "$minCookingTime - $maxCookingTime mins",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
