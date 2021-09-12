import 'package:flutter/material.dart';
import 'package:totask/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

// widget
import '../widgets/welcome.dart';
import '../widgets/streamListTask.dart';

// asset
import '../../../data/utils/assets.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final String name = 'Dicky';
    return Scaffold(
      backgroundColor: background,
      body: ListView(
        children: [
          Welcome(height: height, name: name),
          StreamListTask(height: height, width: width,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Input',
        backgroundColor: fab,
        onPressed: () => Get.toNamed(Routes.INPUT),
        child: Icon(LineIcons.plusCircle),
      ),
    );
  }
}








