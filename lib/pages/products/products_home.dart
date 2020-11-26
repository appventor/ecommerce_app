import 'package:flutter/material.dart';
import 'dart:math';
import 'package:build_context/build_context.dart';

class Products extends StatelessWidget {
  const Products({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our Products",
                  style: context.textTheme.subtitle1,
                ),
                FlatButton(
                  color: Colors.purple,
                  child: Text("View all"),
                  onPressed: () {},
                )
              ],
            ),
          ),
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 50,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
                    borderRadius: BorderRadius.circular(10)),
              );
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8,
              maxCrossAxisExtent: 200,
            ),
          ),
        ],
      ),
    );
  }
}
