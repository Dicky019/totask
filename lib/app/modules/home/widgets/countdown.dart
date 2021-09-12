import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

// widget
import 'timeHours.dart';

class Countdown extends StatelessWidget {
  final doc;
  const Countdown({
    Key? key,
    this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: DateTime.parse(doc['deadline']).millisecondsSinceEpoch,
      widgetBuilder: (_, time) {
        if (time == null) {
          return Text(
            'Waktu habis',
            textAlign: TextAlign.end,
          );
        }
        if (time.days == null) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.av_timer),
              SizedBox(
                width: 3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text((time.min == null) ? 'Detik' : "Hari ini"),
                 TimeHours(time: time,),
                ],
              ),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.timelapse_outlined),
            SizedBox(
              width: 3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${time.days} Hari"),
                TimeHours(time: time,),
              ],
            ),
          ],
        );
      },
    );
  }
}