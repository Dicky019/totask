import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totask/app/data/models/task_model.dart';
import 'package:totask/app/routes/app_pages.dart';

// my controller
import '../controllers/home_controller.dart';
// Widget
import '/shared/widget/list_widget.dart';
import '/shared/widget/no_scroll_glow.dart';
import 'countdown.dart';

class StreamListTask extends GetView<HomeController> {
  final double width;
  final double height;
  const StreamListTask({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.82,
      child: StreamBuilder<QuerySnapshot>(
        stream: controller.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            final jumlah = documents.length;
            return jumlah != 0
                ? ScrollConfiguration(
                    behavior: NoScrollGlow(),
                    child: ListView(
                      children: documents.map((doc) {
                        final data = TaskModel.fromJson(doc);
                        print(data.username);
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  (width <= 1328) ? width * 0.03 : width * 0.2,
                              vertical: 6),
                          child: InkWell(
                            
                            onTap: () => Get.toNamed(Routes.Detail, arguments: {
                              'id': doc.id,
                              'pelajaran': data.pelajaran,
                              'catatan': data.catatan,
                              'deadline': data.deadline,
                              'kelas': data.kelas,
                            }),
                            child: ListTask(
                              catatan: "${data.tampil.toString().trim()}",
                              deadline: Countdown(
                                doc: doc,
                              ),
                              nameCategori: data.username!,
                              nameTask:
                                  "${width <= 520 ? data.tampilPelajaran.toString() : data.pelajaran.toString()}",
                              onTapCancel: () => controller.deleteData(doc.id),
                              key: ValueKey(doc.id),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : Center(child: Text("Masih kosong"));
          } else if (snapshot.hasError) {
            // Error
            return Text('It ${snapshot.hasError}');
          }
          // Loading
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
