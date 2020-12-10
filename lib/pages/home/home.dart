import 'package:flutter/material.dart';

import '../pages.dart';

class HomeRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) =>
      settings.name == null || settings.name.isEmpty || settings.name == '/';

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => Home());

  static Future<T> navigate<T>(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/');
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 1000),
      switchInCurve: Curves.easeIn,
      child: _loaded
          ? LandingPage()
          : Splash(
              loaded: (bool loaded) {
                setState(() {
                  _loaded = loaded;
                });
              },
            ),
    );
  }
}
