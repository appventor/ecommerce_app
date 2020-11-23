import 'package:flutter/material.dart';

import '../pages.dart';

class LoginRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name.startsWith('/login');

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => Login());

  static Future<T> navigate<T>(BuildContext context) =>
      Navigator.pushNamed<T>(context, '/login');

  static Future<T> navigateFromSplash<T>(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/login');
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [],
      ),
    );
  }
}
