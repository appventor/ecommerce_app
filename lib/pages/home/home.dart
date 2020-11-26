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
  bool isLoggedIn;
  int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: IndexedStack(
        index: index,
        children: [
          Splash(
            loaded: (bool loaded) {
              if (loaded)
                setState(() {
                  index = 1;
                });
            },
          ),
          LandingPage(),
        ],
      ),
    );
  }
}
