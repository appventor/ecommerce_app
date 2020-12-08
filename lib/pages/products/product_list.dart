import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return products != null
        ? ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductTile(product: products[index]);
            },
          )
        : SizedBox();
  }
}
