import 'package:ecommerce/bloc/orders_bloc.dart';
import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';
import '../../pages.dart';

class AddToCartButton extends StatefulWidget {
  final Product product;

  const AddToCartButton({Key key, @required this.product}) : super(key: key);
  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int value = 0;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<OrderBloc>(context, listen: false).orders.firstWhere((item) {
    //     if (item.id.compareTo(widget.product.id) == 0) {
    //       print("value item exists, qty: ${item.qty}");
    //       setState(() {
    //         value = item.qty;
    //       });
    //       return true;
    //     } else
    //       return false;
    //   }, orElse: () => null);
    // });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<OrderBloc>(context).orders.firstWhere((item) {
      if (item.id.compareTo(widget.product.id) == 0) {
        setState(() {
          value = item.qty;
        });
        return true;
      } else
        return false;
    }, orElse: () {
      value = 0;
      return null;
    });
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          value < 1
              ? SizedBox()
              : Expanded(
                  child: IconButton(
                    color: Colors.red,
                    icon: Icon(Icons.remove),
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        if (value > 0) value--;
                        Provider.of<OrderBloc>(context, listen: false)
                            .removeItem(item: widget.product);
                      });
                    },
                  ),
                ),
          Expanded(
            child: Container(
              child: Text(
                value < 1 ? "Add" : "$value",
                style: context.textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              color: Colors.red,
              splashRadius: 20,
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  value++;
                  Provider.of<OrderBloc>(context, listen: false)
                      .addItem(item: widget.product);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
