import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map(
          (entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 6.0,
                height: 6.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.8 : 0.4),
                ),
              ),
            );
          },
        ).toList(),
      ),
    ]);
  }
}

final List<String> imgList = [
  "https://i.imgur.com/HGPhG6V.png",
  "https://i.imgur.com/w5EV8Sw.png",
  "https://i.imgur.com/RSbxiym.png"
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                  item,
                  width: 1200,
                ),
                // Positioned(
                //   bottom: 0.0,
                //   left: 0.0,
                //   right: 0.0,
                //   child: Container(
                //     decoration: const BoxDecoration(
                //       gradient: LinearGradient(
                //         colors: [
                //           Color.fromARGB(200, 0, 0, 0),
                //           Color.fromARGB(0, 0, 0, 0)
                //         ],
                //         begin: Alignment.bottomCenter,
                //         end: Alignment.topCenter,
                //       ),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 10.0, horizontal: 20.0),
                //     child: Text(
                //       'No. ${imgList.indexOf(item)} image',
                //       style: const TextStyle(
                //         color: Colors.white,
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    )
    .toList();
