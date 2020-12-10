import 'package:ecommerce/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
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
                  SizedBox(height: 130, child: CategoryTiles()),
                  OfferCarousel(),
                  FeaturedProducts(
                    products: Provider.of<ProductsBloc>(context)
                        .landingPageData
                        ?.products,
                  )
                ],
              ),
            )));
  }
}
