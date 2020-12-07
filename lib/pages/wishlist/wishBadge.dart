import 'package:flutter/material.dart';

class WishBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 25,
      icon: Icon(Icons.favorite),
      onPressed: () => Navigator.of(context).pushNamed("/cart"),
    );
  }
}
