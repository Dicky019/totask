import 'package:flutter/material.dart';
import 'package:get/get.dart';

// widget
import '../controllers/detail_controller.dart';
import '/shared/widget/text_widget.dart';

// asset
import '../../../data/utils/assets.dart';

class Jurusan extends StatelessWidget {
  const Jurusan({
    Key? key,
    required this.tinggi,
    
  }) : super(key: key);

  final double tinggi;
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(Icons.menu_open),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: tinggi / 30,
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: TextWidget(
            text: "${controller.jurusan}",
            size: 16,
            overflow: TextOverflow.ellipsis,
            color: primer,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}