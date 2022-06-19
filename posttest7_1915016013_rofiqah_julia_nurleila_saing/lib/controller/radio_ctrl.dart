import 'package:get/get.dart';

enum Survive { S, M, L, XL, XXL }

class RadioController extends GetxController {
  // Dijadikan .obs supaya library GetX tau bahwa variable ini mau dijadikan global state
  var survive = Survive.S.obs;
  // Saat sebuah variable dibuat dengan .obs, variable otomatis mendapatkan sebuah getter dan setter
  // Cara akses nya:
  // Untuk getter => object.namaVarible.value
  // Untuk setter => object.namaVariable()

  // Bisa dipanggil di onChanged Radio
  onChanged(value) {
    survive(value);
  }
}
