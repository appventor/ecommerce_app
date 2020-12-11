import 'package:ecommerce/bloc/orders_bloc.dart';
import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class CartRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name == '/cart';

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => ShoppingCart());

  static Future<T> navigate<T>(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/cart');
}

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> items = Provider.of<OrderBloc>(context).order.products;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            switchInCurve: Curves.easeIn,
            child: items.length > 0
                ? ListView.builder(
                    itemCount: items.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return index == items.length
                          ? SizedBox(height: 150)
                          : ProductTile(product: items[index]);
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 100,
                        ),
                        Text("Shopping Cart is empty",
                            style: context.textTheme.headline5)
                      ],
                    ),
                  ),
          ),
          items.length > 0 ? SlideUpPanel() : SizedBox(),
          items.length > 0
              ? Container(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  color: Colors.white,
                  height: 60,
                  child: RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CHECKOUT",
                          style: context.accentTextTheme.headline6,
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
