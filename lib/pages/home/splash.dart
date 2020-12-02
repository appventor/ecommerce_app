import 'dart:async';

import '../../services/locator.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class Splash extends StatefulWidget {
  final Function loaded;

  const Splash({Key key, this.loaded}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  SplashState() {
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _logoStyle = FlutterLogoStyle.horizontal;
      });
    });
  }
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;
  DataStorage _dataStorage = locator<DataStorage>();

  @override
  void initState() {
    locator.allReady().then((_) {
      handleStartupLogic();
    });
    super.initState();
  }

  void handleStartupLogic() {
    String user = _dataStorage.getUserData();
    Timer((const Duration(milliseconds: 600)), () {
      switch (user) {
        case 'nil':
          OnboardRouter.navigate(context);
          break;
        case 'login':
          LoginRouter.navigate(context);
          break;
        default:
          widget.loaded(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlutterLogo(
        size: 300.0,
        style: _logoStyle,
      )),
    );
  }
}
