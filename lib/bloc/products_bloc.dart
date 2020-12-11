import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/models.dart';

class ProductsBloc extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  LandingPageData landingPageData;
  Products products;

  Future<LandingPageData> fetchLandingPageData() async {
    CollectionReference ref = firestore.collection("home");
    DocumentSnapshot snapshot = await ref.doc("category").get();
    landingPageData = LandingPageData.fromMap(snapshot.data());
    notifyListeners();
    return landingPageData;
  }

  Future<List<Product>> fetchProducts(DocumentReference productRef) async {
    DocumentSnapshot snapshot = await productRef.get();
    products = Products.fromMap(snapshot.data());
    return products.products;
  }

  Future<Product> fetchProduct(String productID) async {
    Product productData;
    CollectionReference ref = firestore.collection("products");
    DocumentSnapshot snapshot = await ref.doc(productID).get();
    products = Products.fromMap(snapshot.data());
    products.products.where((product) {
      if (product.id == productID) {
        productData = product;
        return true;
      } else
        return false;
    });
    return productData;
  }
}
