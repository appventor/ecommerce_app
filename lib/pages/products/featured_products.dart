import 'package:auto_animated/auto_animated.dart';
import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class FeaturedProducts extends StatefulWidget {
  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  List<Product> products;

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
    products = Provider.of<ProductsBloc>(context).landingPageData?.products;
    return products != null
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                LiveGrid.options(
                  options: LiveOptions(
                      reAnimateOnVisibility: true,
                      showItemInterval: Duration(milliseconds: 100)),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: products?.length ?? 0,
                  itemBuilder: (context, index, animation) => buildAnimatedItem(
                      animation: animation, product: products[index]),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.8,
                    maxCrossAxisExtent: 200,
                  ),
                ),
              ],
            ),
          )
        : SizedBox();
  }
}
