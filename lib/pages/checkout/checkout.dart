import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class CheckoutRouter extends RouterConfig {
  static final _routeRE = RegExp(r'^\/checkout\/(?<cid>[^\/]+)$');

  @override
  bool matches(RouteSettings settings) => settings.name.contains('/checkout');

  @override
  MaterialPageRoute route(RouteSettings settings) {
    assert(matches(settings));
    final match = _routeRE.firstMatch(settings.name);
    return match == null
        ? null
        : MaterialPageRoute(
            settings: settings,
            builder: (_) => Checkout(
                  id: match.namedGroup('cid'),
                  order: settings.arguments,
                ));
  }

  static Future<T> navigate<T>(BuildContext context, String id, Order order) {
    return Navigator.pushNamed<T>(context, '/checkout/$id', arguments: order);
  }
}

class Checkout extends StatelessWidget {
  final String id;
  final Order order;

  const Checkout({Key key, this.id, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Container(
        child: Center(
          child: Text("CHECKOUT", style: context.textTheme.headline6),
        ),
      ),
    );
  }
}
