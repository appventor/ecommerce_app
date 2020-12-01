import 'package:ecommerce/pages/login/login.dart';
import 'package:ecommerce/pages/search/searchpage.dart';
import 'package:flutter/material.dart';
import '../pages/pages.dart';

final navigatorKey = GlobalKey<NavigatorState>();

abstract class RouterConfig {
  bool matches(RouteSettings settings);
  MaterialPageRoute route(RouteSettings settings);

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final router =
        routers.firstWhere((r) => r.matches(settings), orElse: () => null);
    return router != null
        ? router.route(settings)
        : MaterialPageRoute(
            settings: settings,
            builder: (_) =>
                Page404(message: 'unknown route: ${settings.name}'));
  }

  static final routers = [
    HomeRouter(),
    OnboardRouter(),
    LoginRouter(),
    SearchRouter(),
    ProfileRouter(),
    ProductRouter(),
  ];
}
