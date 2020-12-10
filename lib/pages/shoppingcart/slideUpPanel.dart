import 'package:ecommerce/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class SlideUpPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: 0.2,
        minChildSize: 0.2,
        maxChildSize: 0.37,
        builder: (BuildContext context, ScrollController sController) {
          return SingleChildScrollView(
            controller: sController,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 8, bottom: 16),
                      height: 5,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[400]),
                    ),
                  ),
                  Text(
                    "Pricing Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  _pricingDetails(
                      title: "No of Items",
                      value: Provider.of<OrderBloc>(context)
                          .order
                          .totalQty
                          .toString()),
                  _pricingDetails(
                      title: "Sub Total",
                      value:
                          "₹${Provider.of<OrderBloc>(context).order.subTotal.toStringAsFixed(2)}"),
                  _pricingDetails(title: "Tax", value: "18%"),
                  _pricingDetails(
                      title: "Grand Total",
                      value:
                          "₹${Provider.of<OrderBloc>(context).order.grandTotal.toStringAsFixed(2)}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _pricingDetails({String title, String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
          ),
          Text(value)
        ],
      ),
    );
  }
}
