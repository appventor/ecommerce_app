import 'package:flutter/material.dart';
import '../pages.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        body: NestedScrollView(
            headerSliverBuilder: (context, isInnerBoxScrolled) =>
                [AppBarSearch()],
            body: RefreshIndicator(
              onRefresh: () {
                setState(() {});
                return Future.delayed(Duration(seconds: 1));
              },
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  SizedBox(height: 140, child: CategoryTiles()),
                  OfferCarousel(),
                  Products()
                ],
              ),
            )));
  }
}
