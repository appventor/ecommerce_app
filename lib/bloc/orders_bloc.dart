import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

class OrderBloc extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Order> orders = List<Order>();

  addItem({Product item}) {
    orders.firstWhere(
      (orderItem) {
        if (orderItem.id.compareTo(item.id) == 0) {
          print("Item exists, adding Qty");
          orders.remove(orderItem);
          orders.add(orderItem.copyWith(qty: orderItem.qty + 1));
          // print(orderItem.qty);
          return true;
        } else
          return false;
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
    notifyListeners();
  }

  removeItem({Product item}) {
    orders.firstWhere(
      (orderItem) {
        if (orderItem.id.compareTo(item.id) == 0) {
          if (orderItem.qty > 1) {
            print("Item exists, removing Qty");
            orderItem.copyWith(qty: orderItem.qty - 1);
          } else
            orders.remove(orderItem);
          return true;
        } else
          return false;
      },
      orElse: () {
        print("orElse removing the element");
        return null;
      },
    );
    notifyListeners();
  }

  getCurrentOrders() async {}
}
