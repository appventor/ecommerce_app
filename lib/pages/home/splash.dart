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
  // SplashState() {
  // Timer(const Duration(milliseconds: 0), () {
  //   setState(() {
  //     _logoStyle = FlutterLogoStyle.horizontal;
  //   });
  // });
  // }
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;
  DataStorage _dataStorage = locator<DataStorage>();

  @override
  void initState() {
    locator.allReady().then((_) {
      // _dataStorage
      handleStartupLogic();
    });
    super.initState();
  }

  void handleStartupLogic() async {
    String user = await _dataStorage.getUserData();
    print("user is $user");
    Timer((const Duration(seconds: 1)), () {
      setState(() {
        _logoStyle = FlutterLogoStyle.horizontal;
      });
      switch (user) {
        case 'nil':
          OnboardRouter.navigate(context);
          break;
        case 'anon':
          LoginRouter.navigate(context);
          break;
        default:
          widget.loaded(true);
      }
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
