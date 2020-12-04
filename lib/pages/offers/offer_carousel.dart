import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class OfferCarousel extends StatelessWidget {
  const OfferCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> offers =
        context.watch<ProductsBloc>().landingPageData?.offers;
    List<Widget> items = List.generate(
        offers?.length ?? 0,
        (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(offers[index].imageUrl)),
                  // color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  //     .withOpacity(1.0),
                  borderRadius: BorderRadius.circular(10)),
            ));
    return offers != null
        ? CarouselSlider(
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 4,
                autoPlay: items.length > 1 ? true : false,
                viewportFraction: 1.0),
            items: items,
          )
        : SizedBox();
  }
}
