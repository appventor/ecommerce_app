import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

class OrderBloc extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Product> orders = [];
  double subTotal;
  int totalQty;
  double tax = 18;
  double grandTotal;

  calculatePrice() {
    subTotal = 0;
    totalQty = 0;
    orders.map((item) {
      print("${item.title}");
      subTotal += item.price * item.qty;
      totalQty += item.qty;
      print("$subTotal");
    }).toList();
    double taxAmount = (subTotal * (tax / 100));
    grandTotal = subTotal + taxAmount;
  }

  addItem({Product item}) {
    orders.firstWhere(
      (orderItem) {
        if (orderItem.id.compareTo(item.id) == 0) {
          orders.replaceRange(
              orders.indexOf(orderItem),
              orders.indexOf(orderItem) + 1,
              [orderItem.copyWith(qty: orderItem.qty + 1)]);
          return true;
        } else
          return false;
      },
      orElse: () {
        orders.add(item.copyWith(qty: 1));
        return item;
      },
    );
    calculatePrice();
    notifyListeners();
  }

  removeItem({Product item}) {
    orders.firstWhere(
      (orderItem) {
        if (orderItem.id.compareTo(item.id) == 0) {
          if (orderItem.qty > 1) {
            orders.replaceRange(
                orders.indexOf(orderItem),
                orders.indexOf(orderItem) + 1,
                [orderItem.copyWith(qty: orderItem.qty - 1)]);
          } else
            orders.remove(orderItem);
          return true;
        } else
          return false;
      },
      orElse: () {
        return null;
      },
    );
    calculatePrice();
    notifyListeners();
  }

  getCurrentOrders() async {}
}
