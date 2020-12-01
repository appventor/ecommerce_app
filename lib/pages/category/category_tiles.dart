import 'package:flutter/material.dart';

import '../pages.dart';

class CategoryTiles extends StatelessWidget {
  const CategoryTiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: CircleAvatar(
                radius: 40,
                backgroundColor:
                    Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "CAT$index",
                style: context.textTheme.bodyText1,
              ),
            )
          ],
        );
      },
    );
  }
}
