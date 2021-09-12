import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

// controller
import '../controllers/input_controller.dart';

// widget
import '/shared/widget/loading.dart';
import '../widgets/kelas.dart';
import '../widgets/deadline.dart';
import '/shared/widget/dropdown.dart';
import '/shared/widget/text_widget.dart';

//asset
import '../../../data/utils/assets.dart';

class InputView extends GetView<InputController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
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
          text: controller.arg == null ? "Add Task" : "Edit Task",
        ),
      ),
      body: controller.loading == false
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdwonInput(
                    items: controller.itemsPelajaran,
                    item: controller.pelajaran,
                  ),
                  LineWiget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DeadLine(),
                      Expanded(child: SizedBox()),
                      KelasDropDown()
                    ],
                  ),
                  QuillToolbar.basic(
                    multiRowsDisplay: false,
                    showLink: false,
                    controller: controller.controller!.value,
                  ),
                  Container(
                    child: QuillEditor.basic(
                      controller: controller.controller!.value,
                      readOnly: false,
                    ),
                  )
                ],
              ),
            )
          : Loading(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: fab,
        tooltip: controller.arg == null ? 'Add' : 'Edit',
        onPressed: () {
          controller.addTask().whenComplete(() => Get.back());
        },
        child: Icon(Icons.save_sharp),
      ),
    );
  }
}






