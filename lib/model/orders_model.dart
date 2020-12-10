class Orders {
  List<Order> orders;

  Orders({this.orders});

  factory Orders.fromMap(Map<String, dynamic> json) => Orders(
        orders: json["orders"] == null
            ? null
            : List<Order>.from(json["orders"].map((x) => Order.fromMap(x))),
      );
}

class Order {
  String id;
  String transactionID;
  String title;
  int qty;
  String skuId;
  String imageUrl;
  double price;

  Order({
    this.id,
    this.transactionID,
    this.title,
    this.qty,
    this.skuId,
    this.imageUrl,
    this.price,
  });

  Order copyWith({
    String id,
    String title,
    int qty,
    String skuId,
    double price,
    String imageUrl,
  }) =>
      Order(
        id: id ?? this.id,
        title: title ?? this.title,
        qty: qty ?? this.qty,
        skuId: skuId ?? this.skuId,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"] ?? null,
        transactionID: json["transactionID"] ?? null,
        title: json["title"] ?? null,
        qty: json["qty"] ?? null,
        skuId: json["skuId"] ?? null,
        imageUrl: json["imageUrl"] ?? null,
        price: json["price"] == null ? null : json["price"].toDouble(),
      );
}
