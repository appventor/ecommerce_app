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

class _CategoryDetailState extends State<CategoryDetail>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _isList = false;

  List<FilterProducts> choices = [
    FilterProducts(title: 'Home', icon: Icons.home),
    FilterProducts(title: 'Bookmarks', icon: Icons.bookmark),
    FilterProducts(title: 'Settings', icon: Icons.settings),
  ];
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [WishBadge(), CartBadge()],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.category.title,
                  style: context.accentTextTheme.headline5,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isList = !_isList;
                          _isList
                              ? _animationController.forward()
                              : _animationController.reverse();
                        });
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.list_view,
                        size: 30,
                        progress: _animationController,
                      ),
                    ),
                    PopupMenuButton<FilterProducts>(
                      initialValue: choices[0],
                      enableFeedback: true,
                      icon: Icon(
                        Icons.filter_list,
                        size: 30,
                      ),
                      itemBuilder: (context) {
                        return choices
                            .map((filter) => PopupMenuItem(
                                  value: filter,
                                  child: Text(filter.title),
                                ))
                            .toList();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
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
    return ProductList(products: products);
  }
}

class FilterProducts {
  final String title;
  final IconData icon;

  FilterProducts({this.title, this.icon});
}
