import 'package:flutter/material.dart';

class CartBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 25,
      icon: Icon(Icons.shopping_cart_rounded),
      onPressed: () => Navigator.of(context).pushNamed("/cart"),
    );
  }
}
