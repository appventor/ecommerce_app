import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class CategoryTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Category> categories =
        Provider.of<ProductsBloc>(context).landingPageData?.category;
    return categories != null
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                    "/category/${categories[index].id}",
                    arguments: categories[index]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            NetworkImage(categories[index].imageUrl),
                        // backgroundColor:
                        //     Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        //         .withOpacity(1.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        categories[index].title,
                        style: context.textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
              );
            },
          )
        : SizedBox();
  }
}
