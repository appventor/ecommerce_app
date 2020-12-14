import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class FeaturedProducts extends StatefulWidget {
  final List<Product> products;

  const FeaturedProducts({Key key, this.products}) : super(key: key);
  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    return widget.products != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our Products",
                      style: context.textTheme.subtitle1,
                    ),
                    FlatButton(
                      color: Colors.purple,
                      child: Text("View all"),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              ProductGrid(products: widget.products),
            ],
          )
        : SizedBox();
  }
}
