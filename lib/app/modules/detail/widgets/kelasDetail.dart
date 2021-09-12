import 'package:flutter/material.dart';
import 'package:get/get.dart';

// controller
import '../controllers/detail_controller.dart';

// widget
import '/shared/widget/text_widget.dart';

// asset
import '../../../data/utils/assets.dart';

class Kelas extends StatelessWidget {
  const Kelas({
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
          child: Icon(Icons.meeting_room),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: tinggi / 30,
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Center(
            child: TextWidget(
              text: "${controller.kelas}",
              size: 16,
              color: primer,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}