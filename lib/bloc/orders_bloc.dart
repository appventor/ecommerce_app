import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class OrderBloc extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}
