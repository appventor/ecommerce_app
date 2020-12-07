import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return products != null
        ? ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.all(8),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        "/product/${products[index].id}",
                        arguments: products[index]);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Hero(
                        tag: products[index].id,
                        child: Container(
                            margin: EdgeInsets.all(8),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        products[index].images.first)))),
                      ),
                      SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              products[index].title,
                              style: context.textTheme.headline6,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "Price: ₹",
                                  style: context.textTheme.bodyText1,
                                ),
                                TextSpan(
                                  text:
                                      products[index].price.toStringAsFixed(2),
                                  style: context.textTheme.bodyText2.copyWith(
                                      decoration: products[index].offer != null
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                                TextSpan(
                                    text:
                                        "${products[index].offer != null ? products[index].offer.toStringAsFixed(2) : ""}",
                                    style: context.textTheme.bodyText2.copyWith(
                                        decoration:
                                            products[index].offer != null
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none)),
                              ]),
                            )
                          ],
                        ),
                      ),
                      // Container(
                      //   width: 50,
                      //   height: 30,
                      //   color: Colors.pink[300],
                      // )
                    ],
                  ),
                ),
              );
            },
          )
        : SizedBox();
  }
}
