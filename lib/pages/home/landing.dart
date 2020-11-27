import 'package:flutter/material.dart';
import '../pages.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.focusScope.unfocus(),
      child: Scaffold(
          drawer: AppDrawer(),
          body: NestedScrollView(
              headerSliverBuilder: (context, isInnerBoxScrolled) =>
                  [AppBarSearch()],
              body: ListView(
                children: [
                  SizedBox(height: 120, child: CategoryTiles()),
                  OfferCarousel(),
                  Products()
                ],
              ))),
    );
  }
}
