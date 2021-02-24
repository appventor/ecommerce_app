import 'dart:async';

import 'package:ecommerce/bloc/orders_bloc.dart';
import 'package:ecommerce/bloc/products_bloc.dart';

import '../../services/locator.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class Splash extends StatefulWidget {
  final Function loaded;

  const Splash({Key key, this.loaded}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  SplashState() {
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        _logoStyle = FlutterLogoStyle.horizontal;
      });
    });
  }
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;
  DataStorage _dataStorage = locator<DataStorage>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  @override
  void initState() {
    locator.allReady().then((_) {
      handleStartupLogic();
    });
    super.initState();
  }

  void handleStartupLogic() async {
    String user = _dataStorage.getUserData();
    if (!user.contains("nil login")) {
      Provider.of<ProductsBloc>(context, listen: false).fetchLandingPageData();
      Provider.of<OrderBloc>(context, listen: false).getCurrentOrders();
    }

    Timer((const Duration(milliseconds: 900)), () {
      switch (user) {
        case 'nil':
          OnboardRouter.navigate(context);
          break;
        case 'login':
          LoginRouter.navigate(context);
          break;
        default:
          widget.loaded(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Hero(
        tag: "logo",
        child: FlutterLogo(
          size: 300.0,
          style: _logoStyle,
        ),
      )),
    );
  }
}
