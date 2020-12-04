import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class ProductRouter extends RouterConfig {
  static final _routeRE = RegExp(r'^\/product\/(?<pid>[^\/]+)$');

  @override
  bool matches(RouteSettings settings) => settings.name.contains('/product');

  @override
  MaterialPageRoute route(RouteSettings settings) {
    assert(matches(settings));
    final match = _routeRE.firstMatch(settings.name);
    return match == null
        ? null
        : MaterialPageRoute(
            settings: settings,
            builder: (_) => ProductDetail(
                  productID: match.namedGroup('pid'),
                  product: settings.arguments,
                ));
  }

  static Future<T> navigate<T>(
      BuildContext context, String productId, Product product) {
    return Navigator.pushNamed<T>(context, '/product/$productId',
        arguments: product);
  }
}

class ProductDetail extends StatefulWidget {
  final String productID;
  final Product product;

  const ProductDetail({Key key, this.productID, this.product})
      : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Product product;

  fetchProduct() async {
    product = await Provider.of<ProductsBloc>(context, listen: false)
        .fetchProduct(widget.productID);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context).settings.arguments;
    if (product == null) {
      fetchProduct();
    }
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
        ),
        body: product != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: context.textTheme.headline5,
                          ),
                          // Container(
                          //   height: 30,
                          //   width: 30,
                          //   decoration: BoxDecoration(
                          //       color: Colors.red.withOpacity(0.5),
                          //       borderRadius: BorderRadius.circular(5)),
                          //   child: Center(
                          //       child: Text(
                          //     "4.2",
                          //     style: context.textTheme.bodyText1,
                          //   )),
                          // )
                        ],
                      ),
                      ProductImageSlider(
                        id: widget.productID,
                        images: widget.product.images,
                      ),
                      ProductVariant(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Stock:"),
                          AddToCartButton(),
                        ],
                      ),
                      ProductDescription()
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
