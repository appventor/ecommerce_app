import 'package:flutter/material.dart';

import '../pages.dart';

class HomeRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) =>
      settings.name == null || settings.name.isEmpty || settings.name == '/';

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoggedIn;
  int index;
  @override
  void initState() {
    handleStartupLogic();
    super.initState();
  }

  handleStartupLogic() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
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
    ));
  }
}
