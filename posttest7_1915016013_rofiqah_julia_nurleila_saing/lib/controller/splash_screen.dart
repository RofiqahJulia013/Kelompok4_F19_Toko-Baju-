import 'dart:async';

import 'package:get/get.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/auth.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/main_page.dart';

import '../main_page.dart';

class SplashScreenController extends GetxController {
  // Ini mirip initstate
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 5), () {
      // Get.off() == Navigator.pushReplacement()
      Get.off(authentification());
    });
  }
}
