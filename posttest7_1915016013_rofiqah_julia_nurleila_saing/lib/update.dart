import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/nota.dart';

class riwayat extends StatelessWidget {
  final String nama;
  final String alamat;
  final String baju;
  final String jumlah;
  final String total;
  final String bayar;
  final String ukuran;
  final Function? onUpdate;
  final Function? onDelete;

  riwayat(this.nama, this.alamat, this.baju, this.jumlah, this.total,
      this.bayar, this.ukuran,
      {this.onUpdate, this.onDelete});
  @override
  Widget build(BuildContext context) {
    Widget nota2(String nama, String alamat, String baju, String jumlah,
        String total, String bayar) {
      return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Color.fromARGB(255, 147, 120, 138),
          title: Text('Konfirmasi Belanja'),
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 118, 84, 116),
        body: Container(
          margin: const EdgeInsets.only(top: 70, left: 40, right: 40),
          padding: EdgeInsets.all(15),
          width: 700,
          height: 400,
          decoration: BoxDecoration(color: Color.fromARGB(255, 240, 207, 219)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hallo, $nama Terimakasih telah memesan di Toko ARRVi STORE ",
                // style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 71, 7, 74)),
              ),
              SizedBox(height: 10),
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
                "Status Pembayaran : $bayar ",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(
                width: 500,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bayar.png"),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(right: 20, left: 35),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith((states) {
                      return const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8);
                    }),
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                      return Color.fromARGB(255, 75, 47, 56);
                    }),
                    shape: MaterialStateProperty.resolveWith((states) {
                      return StadiumBorder();
                    }),
                  ),
                  onPressed: () {
                    if (onUpdate != null) onUpdate!();
                    riwayat(nama, alamat, baju, jumlah, total, bayar, ukuran);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => CRUD2()));
                  },
                  child: Text(
                    'Konfirmasi Pembayaran',
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

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
                  nama,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                "Nama Baju: $baju",
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "Status Pembayaran: $bayar",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 65,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Color.fromARGB(255, 151, 127, 106),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.update,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      Get.to(nota2(nama, alamat, baju, jumlah, total, bayar));
                    }),
              ),
              SizedBox(
                height: 40,
                width: 65,
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

class CRUD2 extends StatelessWidget {
  const CRUD2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference Data = firestore.collection("Data");
    String bayar = 'Sudah dibayar';
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
          title: Text('Konfirmasi Pembayaran'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              color: Color.fromARGB(255, 227, 211, 227),
              child: Stack(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: Data.snapshots(),
                    builder: (_, snapshot) {
                      return (snapshot.hasData)
                          ? Column(
                              children: snapshot.data!.docs
                                  .map(
                                    (e) => riwayat(
                                      e.get('nama'),
                                      e.get('alamat'),
                                      e.get('Nama Baju'),
                                      e.get('Jumlah Baju'),
                                      e.get('Ukuran Baju'),
                                      e.get('Status Pembayaran'),
                                      e.get('total'),
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
                                    (e) => riwayat(
                                      e.get('nama'),
                                      e.get('alamat'),
                                      e.get('Nama Baju'),
                                      e.get('Jumlah Baju'),
                                      e.get('Ukuran Baju'),
                                      e.get('Status Pembayaran'),
                                      e.get('total'),
                                      onUpdate: () {
                                        Data.doc(e.id).update(
                                            {'Status Pembayaran': bayar});
                                      },
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
                ],
              ),
            )
          ],
        ));
  }
}
