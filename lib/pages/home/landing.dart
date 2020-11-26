import 'package:flutter/material.dart';
import '../pages.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.focusScope.unfocus(),
      child: Scaffold(
          drawer: Drawer(
            child: Container(),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, isInnerBoxScrolled) =>
                [AppBarSearch()],
            body: SingleChildScrollView(
                primary: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 120, child: CategoryTiles()),
                    OfferCarousel(),
                    Products()
                  ],
                )),
          )),
    );
  }
}
