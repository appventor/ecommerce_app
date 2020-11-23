import 'package:flutter/material.dart';
import 'pages/pages.dart';
import 'services/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      navigatorKey: navigatorKey,
      onGenerateRoute: RouterConfig.onGenerateRoute,
    );
  }
}
