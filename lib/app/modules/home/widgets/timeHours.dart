import 'package:flutter/material.dart';

class TimeHours extends StatelessWidget {
  final time;
  const TimeHours({
    Key? key, this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text((time.min != null)
          ? '${(time.hours == null) ? '00' : (time.hours! < 10) ? '0${time.hours}' : time.hours}:${(time.min == null || time.min == 0) ? '00' : (time.min! < 10) ? '0${time.min}' : time.min}'
          : 'detik:${time.sec}');
  }
}