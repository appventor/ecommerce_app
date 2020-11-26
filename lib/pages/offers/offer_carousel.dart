import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class OfferCarousel extends StatefulWidget {
  @override
  _OfferCarouselState createState() => _OfferCarouselState();
}

class _OfferCarouselState extends State<OfferCarousel> {
  List<Widget> items = List.generate(
      4,
      (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: 300,
            decoration: BoxDecoration(
                color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
                borderRadius: BorderRadius.circular(10)),
          ));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 4,
            autoPlay: true,
            viewportFraction: 1.0),
        items: items,
      ),
    );
  }
}
