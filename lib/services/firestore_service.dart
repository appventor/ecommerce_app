import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/models.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  LandingPageData landingPageData;
  List<Product> products;

  Future<LandingPageData> fetchLandingPageData() async {
    print("product bloc running");
    CollectionReference ref = firestore.collection("home");
    DocumentSnapshot snapshot = await ref.doc("category").get();
    landingPageData = LandingPageData.fromMap(snapshot.data());
    return landingPageData;
  }

  Future<List<Product>> fetchProducts(String docId) async {
    CollectionReference ref = firestore.collection("products");
    DocumentSnapshot snapshot = await ref.doc(docId).get();
    // products =
    return products;
  }
}
