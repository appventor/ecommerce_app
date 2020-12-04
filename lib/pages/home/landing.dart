import 'package:ecommerce/bloc/products_bloc.dart';
import 'package:ecommerce/services/locator.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        body: NestedScrollView(
            headerSliverBuilder: (context, isInnerBoxScrolled) =>
                [AppBarSearch()],
            body: RefreshIndicator(
              onRefresh: () async {
                await Provider.of<ProductsBloc>(context, listen: false)
                    .fetchLandingPageData();
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
