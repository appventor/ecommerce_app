import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:build_context/build_context.dart';

class Products extends StatelessWidget {
  const Products({
    Key key,
  }) : super(key: key);

  // Build animated item (helper for all examples)
  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      // For example wrap with fade transition
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 0.1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/product/$index");
            },
            child: Hero(
              tag: "$index",
              child: Material(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1.0),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
        ),
      );

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
          LiveGrid.options(
            options: LiveOptions(
                reAnimateOnVisibility: true,
                showItemInterval: Duration(milliseconds: 100)),
            primary: false,
            shrinkWrap: true,
            itemCount: 50,
            itemBuilder: buildAnimatedItem,
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
