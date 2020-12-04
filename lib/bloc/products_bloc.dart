import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/models.dart';

class ProductsBloc extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  LandingPageData landingPageData;
  List<Product> products;

  Future<LandingPageData> fetchLandingPageData() async {
    CollectionReference ref = firestore.collection("home");
    DocumentSnapshot snapshot = await ref.doc("category").get();
    landingPageData = LandingPageData.fromMap(snapshot.data());
    print("${snapshot.data()}");
    notifyListeners();
    return landingPageData;
  }
}
