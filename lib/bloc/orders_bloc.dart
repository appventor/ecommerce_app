import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

class OrderBloc extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Order> orders;

  addItem({Product item}) {
    orders.firstWhere(
      (orderItem) {
        if (orderItem.id.compareTo(item.id) == 0) {
          print("Item exists, adding Qty");
          orderItem.copyWith(qty: orderItem.qty + 1);
          return true;
        } else
          return true;
      },
      orElse: () {
        print("orElse adding the element");
        Order order = Order(
          id: item.id,
          title: item.title,
          imageUrl: item.images.first,
          price: item.price,
          qty: 1,
          skuId: item.skuId,
        );
        orders.add(order);
        return order;
      },
    );

    // if (orders.isEmpty) {
    //   orders.add(Order(
    //     id: item.id,
    //     title: item.title,
    //     imageUrl: item.images.first,
    //     price: item.price,
    //     qty: 1,
    //     skuId: item.skuId,
    //   ));
    // } else {
    //   orders.firstWhere((orderItem) {
    //     if (orderItem.id.compareTo(item.id) == 0) {
    //       orderItem.copyWith(qty: orderItem.qty + 1);
    //       return true;
    //     } else
    //       return true;
    //   });
    // }
  }

  getCurrentOrders() async {}
}
