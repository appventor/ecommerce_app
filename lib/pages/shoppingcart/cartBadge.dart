import 'package:badges/badges.dart';
import 'package:ecommerce/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class CartBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int items = Provider.of<OrderBloc>(context).orders.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Badge(
        showBadge: items < 1 ? false : true,
        badgeContent: Text(
          items.toString(),
          style: context.accentTextTheme.bodyText1,
        ),
        alignment: Alignment.center,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          child: Icon(Icons.shopping_cart_rounded),
          onTap: () {
            Navigator.of(context).pushNamed("/cart");
          },
        ),
      ),
    );
  }
}
