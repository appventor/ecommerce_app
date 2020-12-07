import 'package:ecommerce/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class LandingPage extends StatelessWidget {
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
                children: [
                  SizedBox(height: 140, child: CategoryTiles()),
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
