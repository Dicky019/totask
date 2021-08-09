import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totask/app/data/models/task_model.dart';
import 'package:totask/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final nama = TextEditingController();
  var jumlah = 0.obs;
  
  //model
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  addUser() {
    userCollection.add(
      TaskModel(
        catatan: "1",
        deadline: "oi",
        nameCategori: "1",
        nameTask: nama.text,
        nameUser: "asu",
      ).toJson(),
    );
  }

  Future deleteData(String id) async {
    userCollection.doc(id).delete();
  }

  // void toInput() {
  //   Get.toNamed(Routes.INPUT);
  // }

  getData() async {
    data = userCollection.snapshots();
  }

  var data;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
