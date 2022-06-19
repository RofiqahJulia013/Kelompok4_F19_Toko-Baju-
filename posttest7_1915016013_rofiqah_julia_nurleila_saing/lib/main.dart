import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/auth.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/main_page.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/checkbox_ctrl.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/radio_ctrl.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/splash_screen.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/text_ctrl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashScreenController spc = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 194, 227),
      body: Center(
        child: Image.asset(
          "assets/logoo.png",
          width: 350,
          height: 350,
        ),
      ),
    );
  }
}
