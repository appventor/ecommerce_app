import 'package:flutter/material.dart';
import '../../pages.dart';

class AddToCartButton extends StatefulWidget {
  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
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
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
