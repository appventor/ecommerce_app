import 'package:flutter/material.dart';

import '../pages.dart';

class SearchRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name.startsWith('/search');

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => SearchPage());

  static Future<T> navigate<T>(BuildContext context) =>
      Navigator.pushNamed<T>(context, '/search');
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.focusScope.unfocus(),
      child: Scaffold(
          appBar: AppBar(
        title: Hero(
            tag: "search",
            child: CustomSearchBar(
              enabled: true,
            )),
      )),
    );
  }
}
