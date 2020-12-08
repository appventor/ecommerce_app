import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class CartRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name == '/cart';

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => ShoppingCart());

  static Future<T> navigate<T>(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/cart');
}

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
            itemCount: 5 + 1,
            itemBuilder: (BuildContext context, int index) {
              return index == 5
                  ? SizedBox(
                      height: 150,
                    )
                  : ProductTile(
                      product: Product(
                          images: ["https://picsum.photos/150"],
                          id: "1234$index",
                          title: "Shirt",
                          price: 123.00));
            },
          ),
          SlideUpPanel(),
          Container(
            margin: EdgeInsets.all(16),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              "CHECKOUT",
              style: context.accentTextTheme.headline6,
            )),
          )
        ],
      ),
    );
  }
}

class SlideUpPanel extends StatelessWidget {
  const SlideUpPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.4,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListView(
                    controller: scrollController,
                    shrinkWrap: true,
                    primary: false,
                    children: [
                      Text(
                        "Pricing Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      _pricingDetails(title: "No of Items", value: "5"),
                      _pricingDetails(title: "Sub Total", value: "134.00"),
                      _pricingDetails(title: "Tax", value: "18%"),
                      _pricingDetails(title: "Grand Total", value: "150.55")
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                height: 5,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400]),
              )
            ],
          ),
        );
      },
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
