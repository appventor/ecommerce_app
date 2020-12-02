// To parse this JSON data, do
//
//     final category = categoryFromMap(jsonString);

import 'dart:convert';

List<Category> categoryFromMap(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromMap(x)));

String categoryToMap(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Category {
  Category({
    this.title,
    this.description,
    this.imageUrl,
    this.products,
    this.subCategory,
    this.offers,
  });

  String title;
  String description;
  String imageUrl;
  String products;
  List<Category> subCategory;
  List<Category> offers;

  Category copyWith({
    String title,
    String description,
    String imageUrl,
    String products,
    List<Category> subCategory,
    List<Category> offers,
  }) =>
      Category(
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        products: products ?? this.products,
        subCategory: subCategory ?? this.subCategory,
        offers: offers ?? this.offers,
      );

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        title: json["title"] ?? null,
        description: json["description"] ?? null,
        imageUrl: json["imageUrl"] ?? null,
        products: json["products"] ?? null,
        subCategory: json["SubCategory"] == null
            ? null
            : List<Category>.from(
                json["SubCategory"].map((x) => Category.fromMap(x))),
        offers: json["offers"] == null
            ? null
            : List<Category>.from(
                json["offers"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "title": title ?? null,
        "description": description ?? null,
        "imageUrl": imageUrl ?? null,
        "products": products ?? null,
        "SubCategory": subCategory == null
            ? null
            : List<dynamic>.from(subCategory.map((x) => x.toMap())),
        "offers": offers == null
            ? null
            : List<dynamic>.from(offers.map((x) => x.toMap())),
      };
}
