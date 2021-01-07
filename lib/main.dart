import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'bloc/products_bloc.dart';
import 'pages/pages.dart';
import 'services/locator.dart';
import 'bloc/orders_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  setupLocator();
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsBloc>(create: (_) => ProductsBloc()),
        ChangeNotifierProvider<OrderBloc>(create: (_) => OrderBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        navigatorKey: navigatorKey,
        onGenerateRoute: RouterConfig.onGenerateRoute,
      ),
    );
  }
}
