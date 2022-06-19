import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/main_page.dart';

class TextController extends GetxController {
  var namaDepan = "".obs;
  var alamat = "".obs;
  var noHp = "".obs;
  var jumlah = "".obs;
  var jenis = "".obs;
  var namaBaju = "".obs;

  // final namaDepanCtrl = TextEditingController();
  // final alamatCtrl = TextEditingController();
  // final noHpCtrl = TextEditingController();
  // final jumlahCtrl = TextEditingController();
  // final jenisCtrl = TextEditingController();
  // final namaBajuCtrl = TextEditingController();

  onPressed() {
    // namaDepan = namaDepanCtrl.text.obs;
    // alamat = alamatCtrl.text.obs;
    // noHp = noHpCtrl.text.obs;
    // jumlah = jumlahCtrl.text.obs;
    // jenis = jenisCtrl.text.obs;
    // namaBaju = jumlahCtrl.text.obs;
  }

  // Mirip dispose() di Stateful
  @override
  void onClose() {
    // namaDepanCtrl.dispose();
    // alamatCtrl.dispose();
    // noHpCtrl.dispose();
    // jumlahCtrl.dispose();
    // jenisCtrl.dispose();
    // namaBajuCtrl.dispose();

    super.onClose();
  }
}
