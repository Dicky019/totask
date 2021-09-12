import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';

// widget
import '../controllers/detail_controller.dart';
import '/shared/widget/text_widget.dart';

class Deadline extends StatelessWidget {
  const Deadline({
    Key? key,
    required this.tinggi,
  
  }) : super(key: key);

  final double tinggi;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailController>();
    return Container(
      height: tinggi / 23,
      child: CountdownTimer(
        endTime:
            DateTime.parse(controller.deadline).millisecondsSinceEpoch,
        widgetBuilder: (_, time) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.av_timer),
              ),
              SizedBox(
                width: 20,
              ),
              (time == null)
                  ? Container(
                      height: tinggi / 30,
                      padding: EdgeInsets.fromLTRB(4, 2, 3, 0),
                      child: Center(
                        child: TextWidget(
                          text: "Waktunya habis",
                          size: 16,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  : Container(
                      height: tinggi / 30,
                      padding: EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: TextWidget(
                        text: (time.days != null)
                            ? "${time.days} Hari ${time.hours}:${time.min}:${time.sec}"
                            : '${time.hours == null ? '00' : time.hours}:${time.min}:${time.sec}',
                        size: 16,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}