import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  SplashState() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _logoStyle = FlutterLogoStyle.horizontal;
      });
    });
  }
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;

  @override
  void initState() {
    super.initState();
    handleStartupLogic();
  }

  void handleStartupLogic() {}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlutterLogo(
      size: 200.0,
      style: _logoStyle,
    ));
  }
}
