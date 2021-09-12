import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

// controller
import '../controllers/detail_controller.dart';

// widget
import '/shared/widget/text_widget.dart';

// asset
import '../../../data/utils/assets.dart';

class CatatanDetil extends StatelessWidget {
  const CatatanDetil({
    Key? key,
    required this.tinggi,
   
  }) : super(key: key);

  final double tinggi;
 

  @override
  Widget build(BuildContext context) {
    final  controller = Get.find<DetailController>();
    return Container(      
      child: Column(
        children: [
          SizedBox(
            height: tinggi / 60,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.menu_book),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: tinggi / 30,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: TextWidget(
                  text: "Catatan :",
                  size: 16,
                  color: primer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: tinggi / 70,
          ),
          QuillEditor(
            controller: controller.controller!.value,
            scrollController: ScrollController(),
            scrollable: true,
            autoFocus: false,
            readOnly: true,
            expands: false,
            minHeight: tinggi * 0.60,
            maxHeight: tinggi * 0.73,
            padding: EdgeInsets.only(left: 4),
            focusNode: FocusNode(canRequestFocus: false),
          ),
        ],
      ),
    );
  }
}