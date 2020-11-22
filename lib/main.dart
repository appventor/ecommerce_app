// import 'package:ecommerce/pages/navigatr.dart';
import 'package:flutter/material.dart';
import 'pages/initial/onboard/onboard.dart';
import 'pages/pages.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BodyContent(),
      navigatorKey: navigatorKey,
      onGenerateRoute: RouterConfig.onGenerateRoute,
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboard(
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
