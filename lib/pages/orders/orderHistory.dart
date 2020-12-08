import 'package:ecommerce/model/models.dart';
import 'package:ecommerce/pages/orders/orderList.dart';
import 'package:flutter/material.dart';
import '../pages.dart';

class OrdersRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name == '/orders';

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => OrderHistory());

  static Future<T> navigate<T>(BuildContext context) =>
      Navigator.pushNamed(context, '/orders');
}

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(
          images: ["https://picsum.photos/50"],
          title: "Shirt",
          stock: 3,
          price: 126.00),
      Product(
          images: ["https://picsum.photos/51"],
          title: "Shirt",
          stock: 3,
          price: 126.00),
      Product(
          images: ["https://picsum.photos/52"],
          title: "Shirt",
          stock: 3,
          price: 126.00),
      Product(
          images: ["https://picsum.photos/53"],
          title: "Shirt",
          stock: 3,
          price: 126.00),
      Product(
          images: ["https://picsum.photos/54"],
          title: "Shirt",
          stock: 3,
          price: 126.00),
      Product(
          images: ["https://picsum.photos/55"],
          title: "Shirt",
          stock: 3,
          price: 126.00)
    ];
    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Status",
                        style: context.textTheme.caption,
                      ),
                      Text(
                        "Total Items: 15",
                        style: context.textTheme.caption,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivered, 5 Nov",
                          style: context.textTheme.bodyText1),
                      Text("₹1299.00", style: context.textTheme.bodyText2)
                    ],
                  ),
                  OrderList(
                    products: products,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
