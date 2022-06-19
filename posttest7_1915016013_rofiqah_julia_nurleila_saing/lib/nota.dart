import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/main_page.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/pesan.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/item_card.dart';

class nota extends StatelessWidget {
  final String nama;
  final String alamat;
  final String baju;
  final String jumlah;
  final String total;
  final String ukuran;
  final String status;

  nota(
    this.nama,
    this.alamat,
    this.baju,
    this.jumlah,
    this.total,
    this.ukuran,
    this.status,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 147, 120, 138),
        title: Text('Nota Belanja'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 118, 84, 116),
      body: Container(
        margin: const EdgeInsets.only(top: 70, left: 40, right: 40),
        padding: EdgeInsets.all(15),
        width: 700,
        height: 350,
        decoration: BoxDecoration(color: Color.fromARGB(255, 240, 207, 219)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Hallo, $nama Terimakasih telah memesan di Toko ARRVi STORE ",
              // style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 71, 7, 74)),
            ),
            SizedBox(height: 8),
            Text(
              "Alamat           : $alamat ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              "Jumlah Baju : $jumlah ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              "Nama Baju    : $baju ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              "Ukuran Baju  : $ukuran  ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              "Total Baju      : $total ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              "Status Pembayaran: $status ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Container(
              width: 500,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/df/f1/3f/dff13ffe8c55ca0867d562b602581818.gif"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class riwayat_pembelian extends StatelessWidget {
  final String nama;
  final String alamat;
  final String baju;
  final String jumlah;
  final String total;
  final String ukuran;
  final String status;
  final Function? onDelete;
  final Function? onUpdate;
  riwayat_pembelian(this.nama, this.alamat, this.baju, this.jumlah, this.total,
      this.ukuran, this.status,
      {this.onDelete, this.onUpdate});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 214, 240),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xfff78000))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  baju,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                "Rp. $total",
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Color.fromARGB(255, 151, 127, 106),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.book,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      Get.to(
                        nota(
                          nama,
                          alamat,
                          baju,
                          jumlah,
                          total,
                          ukuran,
                          status,
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Color.fromARGB(239, 132, 87, 51),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      if (onDelete != null) onDelete!();
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CRUD extends StatelessWidget {
  const CRUD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference Data = firestore.collection("Data");
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
          title: Text('Daftar Belanja'),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
            color: Color.fromARGB(255, 227, 211, 227),
            child: Stack(
              children: [
                // VIEW DATA HERE
                StreamBuilder<QuerySnapshot>(
                  stream: Data.snapshots(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            children: snapshot.data!.docs
                                .map(
                                  (e) => riwayat_pembelian(
                                    e.get('nama'),
                                    e.get('alamat'),
                                    e.get('Nama Baju'),
                                    e.get('Jumlah Baju'),
                                    e.get('total'),
                                    e.get("Ukuran Baju"),
                                    e.get('Status Pembayaran'),
                                  ),
                                )
                                .toList(),
                          )
                        : Text('Loading...');
                  },
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: Data.snapshots(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            children: snapshot.data!.docs
                                .map(
                                  (e) => riwayat_pembelian(
                                    e.get('nama'),
                                    e.get('alamat'),
                                    e.get('Nama Baju'),
                                    e.get('Jumlah Baju'),
                                    e.get('total'),
                                    e.get('Ukuran Baju'),
                                    e.get('Status Pembayaran'),
                                    onDelete: () {
                                      Data.doc(e.id).delete();
                                    },
                                  ),
                                )
                                .toList(),
                          )
                        : Text('Loading...');
                  },
                ),
                // SizedBox(
                //   height: 30,
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     // Navigator.push(
                //     //   context,
                //     //   MaterialPageRoute(builder: (context) => const ()),
                //     // );
                //   },
                //   child: Text('Checkout'),
                // ),
                // SizedBox(height: 150),
              ],
            ),
          )
        ]));
  }
}
