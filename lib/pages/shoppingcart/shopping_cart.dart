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
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(),
    );
  }
}
