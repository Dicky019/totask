import 'package:flutter/material.dart';

// widget
import '/shared/widget/text_widget.dart';

// asset
import '../../../data/utils/assets.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
    required this.height,
    required this.name,
  }) : super(key: key);

  final double height;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.18,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              size: 30,
              color: primer,
              fontWeight: FontWeight.bold,
              text: "What's Up, ${name}!",
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: TextWidget(
                color: primer,
                text: "Let's finish Your Tasks!",
                fontWeight: FontWeight.w500,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}