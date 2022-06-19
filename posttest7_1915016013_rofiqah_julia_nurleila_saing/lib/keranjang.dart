import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/main_page.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/pesan.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/item_card.dart';

class keranjang extends StatelessWidget {
  final String baju;
  final Function? onDelete;
  keranjang(this.baju, {this.onDelete});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 214, 240),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(242, 169, 125, 37))),
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
                      var pergi;
                      if (baju == 'Ohana Dress') {
                        pergi = pesta();
                      } else if (baju == 'Moazam Dress') {
                        pergi = pesta3();
                      } else if (baju == 'Rofi Dress') {
                        pergi = pesta4();
                      } else if (baju == 'Julia Dress') {
                        pergi = pesta5();
                      } else if (baju == 'Kaos Gucci') {
                        pergi = Kaos();
                      } else if (baju == 'Kaos Hermes') {
                        pergi = Kaos1();
                      } else if (baju == 'Kaos Dior') {
                        pergi = Kaos2();
                      } else if (baju == 'Kaos Balenciaga') {
                        pergi = Kaos3();
                      } else if (baju == 'Kemeja Davis') {
                        pergi = Kemeja();
                      } else if (baju == 'Kemeja ADS') {
                        pergi = Kemeja1();
                      } else if (baju == 'Kemeja RJNS') {
                        pergi = Kemeja2();
                      } else {
                        pergi = Kemeja3();
                      }
                      Get.to(pergi);
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

class keranjang1 extends StatelessWidget {
  const keranjang1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference wish = firestore.collection("Wishlist");
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
          title: Text('Favorite'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              color: Color.fromARGB(255, 227, 211, 227),
              child: Stack(
                children: [
                  // VIEW DATA HERE
                  StreamBuilder<QuerySnapshot>(
                    stream: wish.snapshots(),
                    builder: (_, snapshot) {
                      return (snapshot.hasData)
                          ? Column(
                              children: snapshot.data!.docs
                                  .map(
                                    (e) => keranjang(
                                      e.get('Nama Baju'),
                                    ),
                                  )
                                  .toList(),
                            )
                          : Text('Loading...');
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: wish.snapshots(),
                    builder: (_, snapshot) {
                      return (snapshot.hasData)
                          ? Column(
                              children: snapshot.data!.docs
                                  .map(
                                    (e) => keranjang(
                                      e.get('Nama Baju'),
                                      onDelete: () {
                                        wish.doc(e.id).delete();
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
            ),
          ],
        ));
  }
}
