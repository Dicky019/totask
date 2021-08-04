import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:totask/app/data/models/task_model.dart';
import 'package:totask/app/widget/list_widget.dart';

import '../controllers/home_controller.dart';
import '../../../widget/no_scroll_glow.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: controller.data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final documents = snapshot.data!.docs.length;
                      return Text("$documents");
                    } else if (snapshot.hasError) {
                      return Text('It ${snapshot.hasError}');
                    }
                    return Text("Masih kosong");
                  },
                ),
                TextField(
                  controller: controller.nama,
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: controller.addUser,
                  child: Text("Add Data"),
                ),
                // ElevatedButton(
                //   onPressed: controller.tess,
                //   child: Text("tess"),
                // ),
              ],
            ),
          ),
          Container(
            height: 500,
            child: StreamBuilder<QuerySnapshot>(
              stream: controller.data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  final jumlah = documents.length;
                  final model = ModeltoView();
                  return jumlah != 0
                      ? ScrollConfiguration(
                          behavior: NoScrollGlow(),
                          child: ListView(
                              children: documents
                                  .map((doc) => ListTask(
                                        catatan: "hell0",
                                        deadline: Container(),
                                        nameCategori: "nama",
                                        nameTask: "${doc['nameTask']}",
                                        onTapCancel: () =>
                                            controller.deleteData(doc.id),
                                        key: ValueKey(doc.id),
                                      ))
                                  .toList()),
                        )
                      :
                      // saata data kosong
                      Center(child: Text("Masih kosong"));
                } else if (snapshot.hasError) {
                  // Error
                  return Text('It ${snapshot.hasError}');
                }
                // Loading
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
