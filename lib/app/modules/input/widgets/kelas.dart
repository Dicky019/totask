import 'package:flutter/material.dart';
import 'package:get/get.dart';

// controller
import '../controllers/input_controller.dart';

// widget
import '/shared/widget/dropdown.dart';
import '/shared/widget/text_widget.dart';

class KelasDropDown extends StatelessWidget {
  const KelasDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputController controller = Get.find<InputController>();
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          DropdwonInput(
            items: controller.itemsKelas,
            item: controller.kelas,
          ),
          LineWiget(),
        ],
      ),
    );
  }
}