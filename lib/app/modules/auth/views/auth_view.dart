import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:totask/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {

  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset(
              'assets/reg.json',
              height: height * 0.7,
              width: width * 0.5,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(width * 0.4, height * 0.07)),
              icon: LineIcon(LineIcons.googleLogo),
              onPressed: () {
                if (kIsWeb) {
                  controller
                      .signInWithGoogleWeb()
                      .whenComplete(() => Get.offNamed(Routes.HOME));
                } else {
                  controller
                      .signInWithGoogleMobile()
                      .whenComplete(() => Get.offNamed(Routes.HOME));
                }
              },
              label: Text(
                'Login in Web',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
