import 'package:flutter/material.dart';

import '../pages.dart';

class ProductVariant extends StatelessWidget {
  const ProductVariant({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose size",
          style: context.textTheme.bodyText1,
        ),
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 2),
                ),
                child: Center(
                    child: Text(
                  "XS",
                  style: context.textTheme.bodyText1.copyWith(fontSize: 18),
                )),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 2),
                ),
                child: Center(
                    child: Text(
                  "S",
                  style: context.textTheme.bodyText1.copyWith(fontSize: 18),
                )),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 2),
                ),
                child: Center(
                    child: Text(
                  "M",
                  style: context.textTheme.bodyText1.copyWith(fontSize: 18),
                )),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 2),
                ),
                child: Center(
                    child: Text(
                  "L",
                  style: context.textTheme.bodyText1.copyWith(fontSize: 18),
                )),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 2),
                ),
                child: Center(
                    child: Text(
                  "XL",
                  style: context.textTheme.bodyText1.copyWith(fontSize: 18),
                )),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 2),
                ),
                child: Center(
                    child: Text(
                  "XXL",
                  style: context.textTheme.bodyText1.copyWith(fontSize: 18),
                )),
              )
            ],
          ),
        ),
        Text(
          "Choose a color",
          style: context.textTheme.bodyText1,
        ),
        SizedBox(
          height: 80,
          child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(
                4,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    shape: BoxShape.circle,
                    color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
