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
      index: 0,
      children: [
        Splash(),
        LandingPage(),
      ],
    ));
  }
}
