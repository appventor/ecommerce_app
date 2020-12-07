import 'package:flutter/material.dart';

import '../pages.dart';

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Estore"),
      actions: [WishBadge(), CartBadge()],
      floating: true,
      expandedHeight: 110,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Hero(
          tag: "search",
          child: GestureDetector(
              onTap: () => SearchRouter.navigate(context),
              child: CustomSearchBar(
                enabled: false,
              )),
        ),
      ),
    );
  }
}
