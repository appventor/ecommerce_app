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
    this.subCategory,
    this.offers,
    this.products,
  });

  String title;
  String description;
  List<Category> subCategory;
  List<Category> offers;
  String products;

  Category copyWith({
    String title,
    String description,
    List<Category> subCategory,
    List<Category> offers,
    String products,
  }) =>
      Category(
        title: title ?? this.title,
        description: description ?? this.description,
        subCategory: subCategory ?? this.subCategory,
        offers: offers ?? this.offers,
        products: products ?? this.products,
      );

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        subCategory: json["SubCategory"] == null
            ? null
            : List<Category>.from(
                json["SubCategory"].map((x) => Category.fromMap(x))),
        offers: json["offers"] == null
            ? null
            : List<Category>.from(
                json["offers"].map((x) => Category.fromMap(x))),
        products: json["products"] == null ? null : json["products"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "SubCategory": subCategory == null
            ? null
            : List<dynamic>.from(subCategory.map((x) => x.toMap())),
        "offers": offers == null
            ? null
            : List<dynamic>.from(offers.map((x) => x.toMap())),
        "products": products == null ? null : products,
      };
}
