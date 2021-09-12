import 'package:flutter/material.dart';
import '../../app/data/utils/assets.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double size;
  final TextOverflow? overflow;
  final Color color;
  const TextWidget({
    required this.size,
    required this.color,
    required this.fontWeight,
    required this.text,
    Key? key,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        overflow: overflow,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: 'Roboto',
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class LineWiget extends StatelessWidget {
  const LineWiget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2,
      thickness: 2,
      color: primer,
    );
  }
}
