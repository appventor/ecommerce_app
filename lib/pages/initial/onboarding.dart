import 'package:flutter/material.dart';

import '../pages.dart';

class OnboardRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name.startsWith('/welcome');

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => Onboarding());
}

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
