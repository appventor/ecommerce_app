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
      actions: [
        IconButton(
          splashRadius: 25,
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
        IconButton(
          splashRadius: 25,
          icon: Icon(Icons.shopping_cart_rounded),
          onPressed: () {},
        )
      ],
      floating: true,
      expandedHeight: 100,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(64),
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
