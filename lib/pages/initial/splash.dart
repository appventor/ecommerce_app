import 'dart:async';

import 'package:flutter/material.dart';

import '../pages.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  Timer _timer;
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;
  SplashState() {
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        _logoStyle = FlutterLogoStyle.stacked;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlutterLogo(
      size: 200.0,
      style: _logoStyle,
    ));
  }
}
