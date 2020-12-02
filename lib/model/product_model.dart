// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

String productsMockData = """ 
[
  {
    "productId": "q1w2e3r4",
    "title": "Round neck tshirt",
    "description": "Deserunt id dolor",
    "specs": "Esse aute commodo excepteur",
    "brand":"Levis",
    "category":"/Mens/Casual Wear/Tshirts",
    "categoryId":"z1x2c3v4/y1u2i3o4/h1j2k3l4",
    "stock": 100,
    "skuId": "sku123456",
    "price": 299.00,
    "offer": 30,
    "images":["","","",""],
    "option": [
      {
        "optionId": "cc",
        "type": "color",
        "title": "Choose a color",
        "options": [
          {"id":"c1","value":"0xFFFFFFFF"},
          {"id":"c2","value":"0xFFFF0000"},
          {"id":"c3","value":"0xFF0000FF"}
        ]
      },
      {
        "optionId": "ss",
        "type": "size",
        "title": "Select a size",
        "options": [
          {"id":"s1","value":"XS"},
          {"id":"s2","value":"S"},
          {"id":"s3","value":"M"},
          {"id":"s4","value":"L"},
          {"id":"s5","value":"XL"},
          {"id":"s6","value":"XXL"}
        ]
      },
      {
        "optionId": "ff",
        "type": "fit",
        "title": "Choose a fit design",
        "options": [
          {"id":"f1","value":"Slim Fit"},
          {"id":"f2","value":"Regular Fit"},
          {"id":"f3","value":"Extra Loose"}
        ]
      }
    ],
    "variants":[
      {
        "variantId":"q1w2e3r4/cc-c1/ss-s3/ff-f1",
        "skuId": "sku123456",
        "price": 299.50,
        "offer": 10,
        "stock": 40,
        "images":["","","",""]
      },
      {
        "variantId":"q1w2e3r4/cc-c2/ss-s3/ff-f2",
        "skuId": "sku123456",
        "price": 299.50,
        "offer": 10,
        "stock": 30,
        "images":["","","",""]
      },
      {
        "variantId":"q1w2e3r4/cc-c2/ss-s4/ff-f1",
        "skuId": "sku123456",
        "price": 299.50,
        "offer": 10,
        "stock": 10,
        "images":["","","",""]
      },
      {
        "variantId":"q1w2e3r4/cc-c3/ss-s6/ff-f3",
        "skuId": "sku123456",
        "price": 349.50,
        "offer": 10,
        "stock": 20,
        "images":["","","",""]
      }
    ]
  }
]
""";

List<Product> productFromMap(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

String productToMap(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Product {
  Product({
    this.productId,
    this.title,
    this.description,
    this.specs,
    this.brand,
    this.category,
    this.categoryId,
    this.stock,
    this.skuId,
    this.price,
    this.offer,
    this.images,
    this.option,
    this.variants,
  });

  String productId;
  String title;
  String description;
  String specs;
  String brand;
  String category;
  String categoryId;
  int stock;
  String skuId;
  int price;
  int offer;
  List<String> images;
  List<ProductOption> option;
  List<Product> variants;

  Product copyWith({
    String productId,
    String title,
    String description,
    String specs,
    String brand,
    String category,
    String categoryId,
    int stock,
    String skuId,
    int price,
    int offer,
    List<String> images,
    List<ProductOption> option,
    List<Product> variants,
  }) =>
      Product(
        productId: productId ?? this.productId,
        title: title ?? this.title,
        description: description ?? this.description,
        specs: specs ?? this.specs,
        brand: brand ?? this.brand,
        category: category ?? this.category,
        categoryId: categoryId ?? this.categoryId,
        stock: stock ?? this.stock,
        skuId: skuId ?? this.skuId,
        price: price ?? this.price,
        offer: offer ?? this.offer,
        images: images ?? this.images,
        option: option ?? this.option,
        variants: variants ?? this.variants,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        productId: json["productId"] == null ? null : json["productId"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        specs: json["specs"] == null ? null : json["specs"],
        brand: json["brand"] == null ? null : json["brand"],
        category: json["category"] == null ? null : json["category"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        stock: json["stock"] == null ? null : json["stock"],
        skuId: json["skuId"] == null ? null : json["skuId"],
        price: json["price"] == null ? null : json["price"],
        offer: json["offer"] == null ? null : json["offer"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        option: json["option"] == null
            ? null
            : List<ProductOption>.from(
                json["option"].map((x) => ProductOption.fromMap(x))),
        variants: json["variants"] == null
            ? null
            : List<Product>.from(
                json["variants"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "productId": productId == null ? null : productId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "specs": specs == null ? null : specs,
        "brand": brand == null ? null : brand,
        "category": category == null ? null : category,
        "categoryId": categoryId == null ? null : categoryId,
        "stock": stock == null ? null : stock,
        "skuId": skuId == null ? null : skuId,
        "price": price == null ? null : price,
        "offer": offer == null ? null : offer,
        "images":
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "option": option == null
            ? null
            : List<dynamic>.from(option.map((x) => x.toMap())),
        "variants": variants == null
            ? null
            : List<dynamic>.from(variants.map((x) => x.toMap())),
      };
}

class ProductOption {
  ProductOption({
    this.optionId,
    this.type,
    this.title,
    this.options,
  });

  String optionId;
  String type;
  String title;
  List<OptionOption> options;

  ProductOption copyWith({
    String optionId,
    String type,
    String title,
    List<OptionOption> options,
  }) =>
      ProductOption(
        optionId: optionId ?? this.optionId,
        type: type ?? this.type,
        title: title ?? this.title,
        options: options ?? this.options,
      );

  factory ProductOption.fromMap(Map<String, dynamic> json) => ProductOption(
        optionId: json["optionId"] == null ? null : json["optionId"],
        type: json["type"] == null ? null : json["type"],
        title: json["title"] == null ? null : json["title"],
        options: json["options"] == null
            ? null
            : List<OptionOption>.from(
                json["options"].map((x) => OptionOption.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "optionId": optionId == null ? null : optionId,
        "type": type == null ? null : type,
        "title": title == null ? null : title,
        "options": options == null
            ? null
            : List<dynamic>.from(options.map((x) => x.toMap())),
      };
}

class OptionOption {
  OptionOption({
    this.id,
    this.value,
  });

  String id;
  String value;

  OptionOption copyWith({
    String id,
    String value,
  }) =>
      OptionOption(
        id: id ?? this.id,
        value: value ?? this.value,
      );

  factory OptionOption.fromMap(Map<String, dynamic> json) => OptionOption(
        id: json["id"] == null ? null : json["id"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "value": value == null ? null : value,
      };
}
