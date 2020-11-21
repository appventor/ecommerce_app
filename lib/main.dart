// import 'package:ecommerce/pages/navigatr.dart';
import 'package:flutter/material.dart';
import 'pages/pages.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      navigatorKey: navigatorKey,
      onGenerateRoute: RouterConfig.onGenerateRoute,
    );
  }
}
