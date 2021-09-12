import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final nama = TextEditingController();
  var jumlah = 0.obs;
  
  //model
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future deleteData(String id) async {
    userCollection.doc(id).delete();
  }

  Stream<QuerySnapshot<Object?>> getData() async* {
    yield* userCollection.snapshots();
  }

  

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
