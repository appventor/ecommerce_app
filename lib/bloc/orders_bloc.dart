import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/models.dart';
import 'package:flutter/material.dart';

class OrderBloc extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Order order = Order(products: []);

  updateCartFirestore() {
    firestore
        .collection("users")
        .doc("PSU5Ql8Sr61W9riOwkrC")
        .update({"cart": order.toMap()});
  }

  calculatePrice() {
    order.subTotal = 0;
    order.totalQty = 0;
    order.products.map((item) {
      order.subTotal += item.price * item.qty;
      order.totalQty += item.qty;
    }).toList();
    order.taxAmt = (order.subTotal * (18 / 100));
    order.grandTotal = order.subTotal + order.taxAmt;
  }

  addItem({Product item}) {
    if (order.id == null) order.id = firestore.collection("orders").doc().id;

    order.products.firstWhere(
      (orderItem) {
        if (orderItem.id.compareTo(item.id) == 0) {
          order.products.replaceRange(
              order.products.indexOf(orderItem),
              order.products.indexOf(orderItem) + 1,
              [orderItem.copyWith(qty: orderItem.qty + 1)]);
          return true;
        } else
          return false;
      },
      orElse: () {
        order.products.add(item.copyWith(qty: 1));
        return item;
      },
    );
    calculatePrice();
    updateCartFirestore();
    notifyListeners();
  }

  removeItem({Product item}) {
    order.products.firstWhere(
      (orderItem) {
        if (orderItem.id.compareTo(item.id) == 0) {
          if (orderItem.qty > 1) {
            order.products.replaceRange(
                order.products.indexOf(orderItem),
                order.products.indexOf(orderItem) + 1,
                [orderItem.copyWith(qty: orderItem.qty - 1)]);
          } else
            order.products.remove(orderItem);
          return true;
        } else
          return false;
      },
      orElse: () {
        return null;
      },
    );
    calculatePrice();
    updateCartFirestore();
    notifyListeners();
  }

  getCurrentOrders() async {
    DocumentSnapshot snapshot =
        await firestore.collection("users").doc("PSU5Ql8Sr61W9riOwkrC").get();
    order = Order.fromMap(snapshot.data()["cart"]);
  }
}
