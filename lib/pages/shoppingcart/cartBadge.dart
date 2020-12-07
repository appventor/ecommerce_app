import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class CartBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Badge(
        badgeContent: Text(
          "2",
          style: context.accentTextTheme.bodyText1,
        ),
        alignment: Alignment.center,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          child: Icon(Icons.shopping_cart_rounded),
          onTap: () => Navigator.of(context).pushNamed("/cart"),
        ),
      ),
    );
  }
}
