import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  final String message;

  const Page404({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$message Page not found!",
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
