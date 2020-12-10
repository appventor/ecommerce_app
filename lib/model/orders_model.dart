// To parse this JSON data, do
//
//     final order = orderFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

Order orderFromMap(String str) => Order.fromMap(json.decode(str));

String orderToMap(Order data) => json.encode(data.toMap());

class Order {
  Order({
    this.id,
    this.invoiceId,
    this.status,
    this.transactionId,
    this.orderedOn,
    this.deliveryOn,
    this.shippingAddress,
    this.paymentAddress,
    this.paymentType,
    this.subTotal,
    this.grandTotal,
    this.taxAmt,
    this.totalQty,
    this.paymentId,
    this.products,
  });

  String id;
  String invoiceId;
  int status;
  String transactionId;
  DateTime orderedOn;
  DateTime deliveryOn;
  String shippingAddress;
  String paymentAddress;
  int paymentType;
  double subTotal;
  double grandTotal;
  double taxAmt;
  int totalQty;
  String paymentId;
  List<Product> products;

  Order copyWith({
    String id,
    String invoiceId,
    int status,
    String transactionId,
    DateTime orderedOn,
    DateTime deliveryOn,
    String shippingAddress,
    String paymentAddress,
    int paymentType,
    double subTotal,
    double grandTotal,
    double taxAmt,
    int totalQty,
    String paymentId,
    List<Product> products,
  }) =>
      Order(
        id: id ?? this.id,
        invoiceId: invoiceId ?? this.invoiceId,
        status: status ?? this.status,
        transactionId: transactionId ?? this.transactionId,
        orderedOn: orderedOn ?? this.orderedOn,
        deliveryOn: deliveryOn ?? this.deliveryOn,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        paymentAddress: paymentAddress ?? this.paymentAddress,
        paymentType: paymentType ?? this.paymentType,
        subTotal: subTotal ?? this.subTotal,
        grandTotal: grandTotal ?? this.grandTotal,
        taxAmt: taxAmt ?? this.taxAmt,
        totalQty: totalQty ?? this.totalQty,
        paymentId: paymentId ?? this.paymentId,
        products: products ?? this.products,
      );

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"] == null ? null : json["id"],
        invoiceId: json["invoiceID"] == null ? null : json["invoiceID"],
        status: json["status"] == null ? null : json["status"],
        transactionId:
            json["transactionID"] == null ? null : json["transactionID"],
        orderedOn: json["orderedOn"] == null
            ? null
            : DateTime.parse(json["orderedOn"]),
        deliveryOn: json["deliveryOn"] == null
            ? null
            : DateTime.parse(json["deliveryOn"]),
        shippingAddress:
            json["shippingAddress"] == null ? null : json["shippingAddress"],
        paymentAddress:
            json["paymentAddress"] == null ? null : json["paymentAddress"],
        paymentType: json["paymentType"] == null ? null : json["paymentType"],
        subTotal: json["subTotal"] == null ? null : json["subTotal"].toDouble(),
        grandTotal:
            json["grandTotal"] == null ? null : json["grandTotal"].toDouble(),
        taxAmt: json["taxAmt"] == null ? null : json["taxAmt"].toDouble(),
        totalQty: json["totalQty"] == null ? null : json["totalQty"],
        paymentId: json["paymentID"] == null ? null : json["paymentID"],
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "invoiceID": invoiceId == null ? null : invoiceId,
        "status": status == null ? null : status,
        "transactionID": transactionId == null ? null : transactionId,
        "orderedOn": orderedOn == null ? null : orderedOn.toIso8601String(),
        "deliveryOn": deliveryOn == null ? null : deliveryOn.toIso8601String(),
        "shippingAddress": shippingAddress == null ? null : shippingAddress,
        "paymentAddress": paymentAddress == null ? null : paymentAddress,
        "paymentType": paymentType == null ? null : paymentType,
        "subTotal": subTotal == null ? null : subTotal,
        "grandTotal": grandTotal == null ? null : grandTotal,
        "taxAmt": taxAmt == null ? null : taxAmt,
        "totalQty": totalQty == null ? null : totalQty,
        "paymentID": paymentId == null ? null : paymentId,
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toMap())),
      };
}
