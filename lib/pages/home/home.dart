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
  bool isLoggedIn = false;
  @override
  void initState() {
    handleStartupLogic();
    super.initState();
  }

  handleStartupLogic() {
    //TODO: handle login routing here
    Future.delayed(Duration(seconds: 3)).then((value) {
      LoginRouter.navigateFromSplash(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Splash());
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
