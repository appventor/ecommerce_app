import 'package:flutter/material.dart';
import '../pages.dart';

class OrdersRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name == '/orders';

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => OrderHistory());

  static Future<T> navigate<T>(BuildContext context) =>
      Navigator.pushNamed(context, '/orders');
}

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: Container(
        child: Center(
          child: Text("My Orders", style: context.textTheme.headline6),
        ),
      ),
    );
  }
}
