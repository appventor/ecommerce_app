class Offer {
  Offer({
    this.id,
    this.title,
    this.description,
    this.price,
    this.offer,
    this.imageUrl,
  });

  String id;
  String title;
  String description;
  double price;
  int offer;
  String imageUrl;

  Offer copyWith({
    String id,
    String title,
    String description,
    double price,
    int offer,
    String imageUrl,
  }) =>
      Offer(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        offer: offer ?? this.offer,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Offer.fromMap(Map<String, dynamic> json) => Offer(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        offer: json["offer"] == null ? null : json["offer"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "offer": offer == null ? null : offer,
        "imageUrl": imageUrl == null ? null : imageUrl,
      };
}
