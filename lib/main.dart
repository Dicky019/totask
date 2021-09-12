import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/routes/app_pages.dart';
import 'app/data/utils/assets.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final user = Rx(FirebaseAuth.instance.currentUser);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Totask",
      initialRoute: (user.value == null) ? Routes.AUTH : AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: primer,
        primarySwatch: Colors.purple,
      ),
    ),
  );
}
