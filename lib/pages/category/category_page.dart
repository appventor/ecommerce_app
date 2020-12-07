import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/models.dart';
import 'package:ecommerce/pages/products/product_list.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class CategoryRouter extends RouterConfig {
  static final _routeRE = RegExp(r'^\/category\/(?<cid>[^\/]+)$');

  @override
  bool matches(RouteSettings settings) => settings.name.contains('/category');

  @override
  MaterialPageRoute route(RouteSettings settings) {
    assert(matches(settings));
    final match = _routeRE.firstMatch(settings.name);
    return match == null
        ? null
        : MaterialPageRoute(
            settings: settings,
            builder: (_) => CategoryDetail(
                  id: match.namedGroup('cid'),
                  category: settings.arguments,
                ));
  }

  static Future<T> navigate<T>(
      BuildContext context, String id, Category category) {
    return Navigator.pushNamed<T>(context, '/category/$id',
        arguments: category);
  }
}

class CategoryDetail extends StatefulWidget {
  final String id;
  final Category category;

  const CategoryDetail({Key key, this.id, this.category}) : super(key: key);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [WishBadge(), CartBadge()],
      ),
      body: widget.category != null
          ? CatalogBrowser(productRef: widget.category.products)
          : SizedBox(),
    );
  }
}

class CatalogBrowser extends StatefulWidget {
  final DocumentReference productRef;

  const CatalogBrowser({Key key, this.productRef}) : super(key: key);
  @override
  _CatalogBrowserState createState() => _CatalogBrowserState();
}

class _CatalogBrowserState extends State<CatalogBrowser> {
  List<Product> products;
  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  _getProducts() async {
    products = await Provider.of<ProductsBloc>(context, listen: false)
        .fetchProducts(widget.productRef);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("catalog browser");
    return ProductList(products: products);
  }
}
