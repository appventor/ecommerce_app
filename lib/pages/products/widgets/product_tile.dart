import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';
import '../../pages.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed("/product/${product.id}", arguments: product);
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Hero(
              tag: product.id,
              child: Container(
                  margin: EdgeInsets.all(8),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product.images.first)))),
            ),
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    product.title,
                    style: context.textTheme.headline6,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Price: ₹",
                        style: context.textTheme.bodyText1,
                      ),
                      TextSpan(
                        text: product.price.toStringAsFixed(2),
                        style: context.textTheme.bodyText2.copyWith(
                            decoration: product.offer != null
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      TextSpan(
                          text:
                              "${product.offer != null ? product.offer.toStringAsFixed(2) : ""}",
                          style: context.textTheme.bodyText2.copyWith(
                              decoration: product.offer != null
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none)),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
