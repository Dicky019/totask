import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:totask/app/widget/list_widget.dart';

import '../controllers/home_controller.dart';
import '../../../widget/no_scroll_glow.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    print("$height ++++++++++++++ $width");
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TextField(
                  controller: controller.nama,
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: controller.addUser,
                  child: Text("Add Data"),
                ),
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
