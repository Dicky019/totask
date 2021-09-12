import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:totask/app/routes/app_pages.dart';

// controller
import '../controllers/detail_controller.dart';

// widget
import 'package:totask/app/modules/detail/widgets/catatanDetail.dart';
import '../widgets/kelasDetail.dart';
import '../widgets/deadlineDetail.dart';
import '../widgets/jurusanDetail.dart';
import '/shared/widget/text_widget.dart';

// assets
import '../../../data/utils/assets.dart';


class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        iconTheme: IconThemeData(color: primer),
        title: TextWidget(
          size: 22,
          color: primer,
          fontWeight: FontWeight.bold,
          text: "Detail",
        ),
        actions: [
          IconButton(
            tooltip: 'Update',
            icon: Icon(LineIcons.edit),
            onPressed: () =>
                Get.toNamed(Routes.INPUT, arguments: controller.arg),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Jurusan(tinggi: tinggi),
          LineWiget(),
          Deadline(tinggi: tinggi),
          LineWiget(),
          Kelas(tinggi: tinggi),
          LineWiget(),
          
          CatatanDetil(tinggi: tinggi)
        ],
      ),
    );
  }
}








