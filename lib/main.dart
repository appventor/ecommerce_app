import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/pages.dart';
import 'services/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  setupLocator();
  runApp(Provider<ProductsBloc>(
    create: (BuildContext context) => ProductsBloc(),
    child: RootApp(),
  ));
}

class RootApp extends StatelessWidget {
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
