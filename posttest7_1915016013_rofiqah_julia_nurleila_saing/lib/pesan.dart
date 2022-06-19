import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/flutter_fire2.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/checkbox_ctrl.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/radio_ctrl.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/splash_screen.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/text_ctrl.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/main_page.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/nota.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/update.dart';

class pesan extends StatefulWidget {
  const pesan({Key? key}) : super(key: key);

  @override
  _pesanState createState() => _pesanState();
}

class _pesanState extends State<pesan> {
  final CheckBoxController cc = Get.put(CheckBoxController());

  final TextEditingController namaDepanCtrl = TextEditingController();
  final TextEditingController alamatCtrl = TextEditingController();
  final TextEditingController noHpCtrl = TextEditingController();
  final TextEditingController jumlahCtrl = TextEditingController();
  final TextEditingController jenisCtrl = TextEditingController();
  final TextEditingController namaBajuCtrl = TextEditingController();
  final TextEditingController ukuranbaju = TextEditingController();
  final uk = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];

  final baju = [
    'Ohana Dress',
    'Moazam Dress',
    'Rofi Dress',
    'Julia Dress',
    'Kaos Gucci',
    'Kaos Hermes',
    'Kaos Dior',
    'Kaos Balenciaga',
    'Kemeja Davis',
    'Kemeja ADS',
    'Kemeja RJNS',
    'Kemeja Nevada',
  ];

  String? value;
  String? value2;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    // Karena tidak memakai Stateful, kita tidak memiliki method dispose() untuk menghilangkan controller
    // Maka dari itu, kita harus menaruh GetxController di dalam method build()
    // Agar terdispose jika widget terpop

    // final TextController tc = Get.put(TextController());

    @override
    void dispose() {
      namaDepanCtrl.dispose();
      alamatCtrl.dispose();
      noHpCtrl.dispose();
      jumlahCtrl.dispose();
      jenisCtrl.dispose();

      ukuranbaju.dispose();
      super.dispose();
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference Data = firestore.collection("Data");

    return Scaffold(
      appBar: AppBar(
        title: Text("Proses Pemesanan Barang"),
        backgroundColor: Color.fromARGB(255, 104, 76, 95),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: namaDepanCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama ",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: alamatCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Alamat",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: noHpCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "No Hp ",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: jumlahCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Jumlah Pesanan",
                ),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                hint: Text('Nama Baju'),
                iconSize: 36,
                isExpanded: true,
                value: value2,
                items: baju.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    value2 = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                hint: Text('Ukuran'),
                iconSize: 36,
                isExpanded: true,
                items: uk.map(buildMenuItem).toList(),
                value: value,
                onChanged: (value) => setState(() => this.value = value),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 154, 53, 147)),
                onPressed: () {
                  if (namaBajuCtrl.text == null ||
                      alamatCtrl.text == null ||
                      noHpCtrl.text == null ||
                      jumlahCtrl.text == null ||
                      value == null ||
                      value2 == null) {
                    CustomAlert(context, "Data Tidak Boleh ada yang Kosong");
                  } else {
                    int harga;
                    if (namaBajuCtrl == "Ohana Dress") {
                      harga = 250000;
                    } else if (namaBajuCtrl == "Moazam Dress") {
                      harga = 200000;
                    } else if (namaBajuCtrl == "Rofi Dress") {
                      harga = 200000;
                    } else if (namaBajuCtrl == "Julia Dress") {
                      harga = 300000;
                    } else if (namaBajuCtrl == "Kaos Guci") {
                      harga = 500000;
                    } else if (namaBajuCtrl == "Kaos Hermes") {
                      harga = 550000;
                    } else if (namaBajuCtrl == "Kaos Dior") {
                      harga = 450000;
                    } else if (namaBajuCtrl == "Kaos Balenciaga") {
                      harga = 300000;
                    } else if (namaBajuCtrl == "Kemeja Davis") {
                      harga = 150000;
                    } else if (namaBajuCtrl == "Kemeja ADS") {
                      harga = 50000;
                    } else if (namaBajuCtrl == "Kemeja RJNS") {
                      harga = 100000;
                    } else {
                      harga = 200000;
                    }
                    int jumlah = int.parse(jumlahCtrl.text);
                    int total = jumlah * harga;
                    var status = "Belum dibayar";
                    Data.add({
                      'nama': namaDepanCtrl.text,
                      'alamat': alamatCtrl.text,
                      'No Hp': noHpCtrl.text,
                      'Jumlah Baju': jumlahCtrl.text,
                      'Jenis Baju': jenisCtrl.text,
                      'Nama Baju': value2,
                      'Ukuran Baju': value,
                      'total': "$total",
                      'Status Pembayaran': status,
                    });

                    final mySnackBar = SnackBar(
                      content: Text(
                        "Pesanan Sedang diproses ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      duration: Duration(seconds: 3),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.amber,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(mySnackBar);

                    Get.to(nota(namaDepanCtrl.text, alamatCtrl.text, '$value2',
                        jumlahCtrl.text, "$total", '$value', status));
                  }
                },
                child: Text("PESAN"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
