import 'package:auto_animated/auto_animated.dart';
import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class OrderList extends StatefulWidget {
  final List<Product> products;

  const OrderList({Key key, this.products}) : super(key: key);
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<Product> firstView = List<Product>();

  @override
  void initState() {
    firstView.addAll(widget.products.getRange(0, 2));
    super.initState();
  }

  _loadMore() {
    setState(() {
      firstView.addAll(widget.products.getRange(2, widget.products.length));
    });
  }

  _showLess() {
    setState(() {
      firstView.removeRange(2, widget.products.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LiveList(
      itemCount: firstView.length + 1,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index, animation) {
        return index == firstView.length
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Divider(
                      indent: 8,
                      endIndent: 8,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  OutlineButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () => firstView.length == widget.products.length
                        ? _showLess()
                        : _loadMore(),
                    icon: Icon(
                      firstView.length == widget.products.length
                          ? Icons.remove
                          : Icons.add,
                      size: 20,
                      color: Colors.grey[700],
                    ),
                    label: Text(
                      firstView.length == widget.products.length
                          ? "Show Less"
                          : "Load More",
                      style: context.textTheme.caption,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 8,
                      endIndent: 8,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  )
                ],
              )
            : ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(firstView[index].images.first)),
                  ),
                ),
                title: Text(
                  firstView[index].title,
                  style: context.textTheme.bodyText1,
                ),
                subtitle: Text(
                  "Price: ₹${firstView[index].price.toStringAsFixed(2)}",
                  style: context.textTheme.caption,
                ),
                trailing: Text("Qty: 3"),
              );
      },
    );
  }
}
