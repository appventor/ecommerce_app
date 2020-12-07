import 'package:flutter/material.dart';

import '../pages.dart';

class WishlistRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name == '/wishlist';

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => WishlistPage());

  static Future<T> navigate<T>(BuildContext context) =>
      Navigator.pushNamed(context, '/wishlist');
}

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        actions: [WishBadge(), CartBadge()],
      ),
    );
  }
}
