// To parse this JSON data, do
//
//     final categories = categoriesFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

LandingPageData categoriesFromMap(String str) =>
    LandingPageData.fromMap(json.decode(str));

String categoriesToMap(LandingPageData data) => json.encode(data.toMap());

class LandingPageData {
  LandingPageData({
    this.category,
    this.offers,
    this.products,
  });

  List<Category> category;
  List<Category> offers;
  List<Product> products;

  LandingPageData copyWith({
    List<Category> category,
    List<Category> offers,
    List<Product> products,
  }) =>
      LandingPageData(
        category: category ?? this.category,
        offers: offers ?? this.offers,
        products: products ?? this.products,
      );

  factory LandingPageData.fromMap(Map<String, dynamic> json) => LandingPageData(
        category: json["category"] == null
            ? null
            : List<Category>.from(
                json["category"].map((x) => Category.fromMap(x))),
        offers: json["offers"] == null
            ? null
            : List<Category>.from(
                json["offers"].map((x) => Category.fromMap(x))),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "category": category == null
            ? null
            : List<dynamic>.from(category.map((x) => x.toMap())),
        "offers": offers == null
            ? null
            : List<dynamic>.from(offers.map((x) => x.toMap())),
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toMap())),
      };
}

class Category {
  Category({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.subCategory,
    this.products,
    this.offer,
  });

  String id;
  String title;
  String description;
  String imageUrl;
  List<Category> subCategory;
  String products;
  String offer;

  Category copyWith({
    String id,
    String title,
    String description,
    String imageUrl,
    List<Category> subCategory,
    String products,
    String offer,
  }) =>
      Category(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        subCategory: subCategory ?? this.subCategory,
        products: products ?? this.products,
        offer: offer ?? this.offer,
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
        products: json["products"] == null ? null : json["products"],
        offer: json["offer"] == null ? null : json["offer"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "subCategory": subCategory == null
            ? null
            : List<dynamic>.from(subCategory.map((x) => x.toMap())),
        "products": products == null ? null : products,
        "offer": offer == null ? null : offer,
      };
}
