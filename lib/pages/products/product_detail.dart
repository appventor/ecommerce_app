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
                ));
  }

  static Future<T> navigate<T>(BuildContext context, String productId) {
    return Navigator.pushNamed<T>(context, '/product/$productId');
  }
}

class ProductDetail extends StatelessWidget {
  final String productID;

  const ProductDetail({Key key, this.productID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
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
                      "Product Title",
                      style: context.textTheme.headline5,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        "4.2",
                        style: context.textTheme.bodyText1,
                      )),
                    )
                  ],
                ),
                ProductImageSlider(
                  productID: productID,
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
        ));
  }
}

class ProductDescription extends StatefulWidget {
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(
              child: Text(
                "Description",
                style: TextStyle(color: Colors.red),
              ),
            ),
            Tab(
              child: Text(
                "Specification",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(
                height: 300,
                color: Colors.indigo,
              ),
              Container(
                height: 300,
                color: Colors.pink,
              )
            ],
          ),
        ),
      ],
    );
  }
}
