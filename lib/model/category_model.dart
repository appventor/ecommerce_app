// To parse this JSON data, do
//
//     final category = categoryFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

String categoryMockData = """
[
  {
    "id": "q1w2e3r4t5",
    "title": "Mens",
    "description": "Dolor quis occaecat laborum proident ad quis et consequat laboris laboris",
    "imageUrl": "",
    "subCategory": [{
      "id": "q1w2e3r4t5/a1s2d3f4g5",
      "title": "Casual Wear",
      "description": "Dolor quis occaecat laborum proident ad quis et consequat laboris laboris",
      "imageUrl": "",
    }],
    "offers": [
      {
        "id":"",
        "title":"",
        "description":"",
        "price":12.50,
        "offer": 10,
        "imageUrl": ""
      }
    ],
    "products": $productsMockData
  }
]
""";

List<Category> categoryFromMap(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromMap(x)));

String categoryToMap(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Category {
  Category({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.subCategory,
    this.offers,
    this.products,
  });

  String id;
  String title;
  String description;
  String imageUrl;
  List<Category> subCategory;
  List<Offer> offers;
  List<Product> products;

  Category copyWith({
    String id,
    String title,
    String description,
    String imageUrl,
    List<Category> subCategory,
    List<Offer> offers,
    List<Product> products,
  }) =>
      Category(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        subCategory: subCategory ?? this.subCategory,
        offers: offers ?? this.offers,
        products: products ?? this.products,
      );

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        subCategory: json["subCategory"] == null
            ? null
            : List<Category>.from(
                json["subCategory"].map((x) => Category.fromMap(x))),
        offers: json["offers"] == null
            ? null
            : List<Offer>.from(json["offers"].map((x) => Offer.fromMap(x))),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "subCategory": subCategory == null
            ? null
            : List<dynamic>.from(subCategory.map((x) => x.toMap())),
        "offers": offers == null
            ? null
            : List<dynamic>.from(offers.map((x) => x.toMap())),
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toMap())),
      };
}
