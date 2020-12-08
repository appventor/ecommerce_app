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
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [Text("TITLE"), Text("12/11/2020")],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
