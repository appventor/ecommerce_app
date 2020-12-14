import 'package:auto_animated/auto_animated.dart';
import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatefulWidget {
  final List<Product> products;

  const ProductGrid({Key key, this.products}) : super(key: key);
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  Widget buildAnimatedItem({Animation<double> animation, Product product}) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 0.1),
            end: Offset.zero,
          ).animate(animation),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed("/product/${product.id}", arguments: product);
            },
            child: Hero(
              tag: "${product.id}",
              child: Material(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product.images.first)),
                      // color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                      //     .withOpacity(1.0),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return LiveGrid.options(
      options: LiveOptions(
          reAnimateOnVisibility: true,
          showItemInterval: Duration(milliseconds: 100)),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      primary: false,
      shrinkWrap: true,
      itemCount: widget.products.length,
      itemBuilder: (context, index, animation) => buildAnimatedItem(
          animation: animation, product: widget.products[index]),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8,
        maxCrossAxisExtent: 200,
      ),
    );
  }
}
