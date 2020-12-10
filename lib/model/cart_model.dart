// To parse this JSON data, do
//
//     final cartItems = cartItemsFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

CartItems cartItemsFromMap(String str) => CartItems.fromMap(json.decode(str));

String cartItemsToMap(CartItems data) => json.encode(data.toMap());

class CartItems {
  CartItems({
    this.items,
  });

  List<Product> items;

  CartItems copyWith({
    List<Product> items,
  }) =>
      CartItems(
        items: items ?? this.items,
      );

  factory CartItems.fromMap(Map<String, dynamic> json) => CartItems(
        items: json["items"] == null
            ? null
            : List<Product>.from(json["items"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toMap())),
      };
}
