// ignore_for_file: prefer_const_constructors, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/auth.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/item_card.dart';
import 'package:get/get.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/checkbox_ctrl.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/radio_ctrl.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/splash_screen.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/controller/text_ctrl.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/pesan.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/nota.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/keranjang.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/about.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/update.dart';

enum Ukuran { s, m, l, xl, xxl }

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 104, 76, 95),
        title: Text(
          "A R R V i  S T O R E",
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 241, 207, 234),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.values,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/welcome.png"),
                    ),
                  ),
                ),
                Text(
                  "ARRVi STORE ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 170, 60, 133),
                  ),
                ),
                Container(
                  width: 400,
                  height: 373,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/tko.PNG"),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 30, left: 30),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/b.png"),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 30),
                      width: 140,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://img.pikbest.com/png-images/20191028/little-girl-pushing-a-shopping-cart-to-buy-things-gif_2515300.png!bw700"),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    "ARRVi Store adalah toko baju anak-anak, toko baju ini memiliki kualitas baju yang sudah sangat bagus dan bahan yang dibuat juga sangat bagus buat anak-anak. Baju-baju yang dijual sudah terjamin dan sudah teruji sehingga pembeli tidak perlu khawatir dengan baju yang ingin dibeli. Pastikan pesanan anda sesuai dengan keinginan anda yah, jangan lupa membeli yang banyak yah bajunya karena toko kami akan memberikan kupon berhadiah untuk pembeli ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 163, 5, 111),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                Container(
                  width: 100,
                  height: 30,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 129, 72, 126)),
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Hal1()));
                      });
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SizeContainer extends StatelessWidget {
  const SizeContainer({Key? key, this.isActive = false, required this.size})
      : super(key: key);

  final bool isActive;
  final String size;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference Data = firestore.collection("Data");
    return Container(
      width: 85,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:
            isActive ? Color.fromARGB(255, 171, 34, 155) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: Color.fromARGB(255, 174, 56, 176),
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : Color.fromARGB(255, 191, 26, 185),
        ),
      ),
    );
  }
}

// halaman 1
class Hal1 extends StatelessWidget {
  const Hal1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference wish = firestore.collection("Wishlist");
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
          title: Text(
            'Daftar Baju',
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: "Dress"),
              Tab(text: "Kaos"),
              Tab(text: "Kemeja"),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/aaa.png"),
                  ),
                ),
              ),
              ListTile(
                title: Text('About'),
                leading: Icon(Icons.library_books_outlined),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AboutScreen()));
                },
              ),
              ListTile(
                title: Text('Daftar Baju'),
                leading: Icon(Icons.list_alt_rounded),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Hal1()));
                },
              ),
              ListTile(
                title: Text('Pesan'),
                leading: Icon(Icons.book_online_outlined),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => pesan()));
                },
              ),
              ListTile(
                title: Text('Favorite'),
                leading: Icon(Icons.favorite),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => keranjang1()));
                },
              ),
              ListTile(
                title: Text('Konfirmasi Pembayaran'),
                leading: Icon(Icons.update),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CRUD2()));
                },
              ),
              ListTile(
                title: Text('Nota'),
                leading: Icon(Icons.aod_sharp),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CRUD()));
                },
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => authentification()));
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Container(
                  width: 500,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/pita.png"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 220,
                            height: 270,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/pesta9.PNG"),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Ohana Dress",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 40,
                            image: AssetImage("assets/bintang.png"),
                          ),
                          Text(
                            "Rp 250.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(pesta()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Ohana Dress"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //pesta3
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 360,
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/pesta3.jpg",
                                ),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Moazam Dress",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 27,
                            image: AssetImage("assets/bintang4.png"),
                          ),
                          Text(
                            "Rp 200.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(pesta3()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Moazam Dress"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // pesta 4
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 210,
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/pesta4.jpg",
                                ),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Rofi Dress",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 33,
                            image: AssetImage("assets/bintang.png"),
                          ),
                          Text(
                            "Rp 200.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(pesta4()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Rofi Dress"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // pesta 5
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 210,
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/pesta8.PNG",
                                ),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Julia Deress",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 30,
                            image: AssetImage("assets/bintang.png"),
                          ),
                          Text(
                            "Rp 300.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(pesta5()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Julia Dress"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/4b/e7/15/4be7153b42ea140ee0fa817725de91a1.gif"),
                    ),
                  ),
                ),
                //===

                // KAOS
              ],
            ),
            ListView(
              children: [
                Container(
                  width: 500,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/pita.png"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 190,
                            height: 290,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/gucci.PNG"),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Gucci ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 27,
                            image: AssetImage("assets/bintang4.png"),
                          ),
                          Text(
                            "Rp 500.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(Kaos()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Kaos Gucci"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Hermes
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 220,
                            height: 260,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/hermes.PNG",
                                ),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Hermes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 40,
                            image: AssetImage("assets/bintang.png"),
                          ),
                          Text(
                            "Rp 550.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(Kaos1()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Kaos Hermes"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Dior
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 210,
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/dior.PNG",
                                ),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Dior",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 33,
                            image: AssetImage("assets/bintang.png"),
                          ),
                          Text(
                            "Rp 450.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(Kaos2()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Kaos Dior"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Balenciaga
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 190,
                            height: 260,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/balenciaga.PNG",
                                ),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Balenciaga",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 27,
                            image: AssetImage("assets/bintang4.png"),
                          ),
                          Text(
                            "Rp 300.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(Kaos3()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Kaos Balenciaga"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/4b/e7/15/4be7153b42ea140ee0fa817725de91a1.gif"),
                    ),
                  ),
                ),
                //===

                // Kemeja
              ],
            ),
            ListView(
              children: [
                Container(
                  width: 500,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/pita.png"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 190,
                            height: 290,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/davis.PNG"),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Davis ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 27,
                            image: AssetImage("assets/bintang.png"),
                          ),
                          Text(
                            "Rp 150.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(Kemeja()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Kemeja Davis"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //ads
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 200,
                            height: 280,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/ads.PNG",
                                ),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "ADS",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 40,
                            image: AssetImage("assets/bintang.png"),
                          ),
                          Text(
                            "Rp 50.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(Kemeja1()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Kemeja ADS"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // rjns
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 210,
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/rjns.PNG",
                                ),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "RJNS",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 33,
                            image: AssetImage("assets/bintang4.png"),
                          ),
                          Text(
                            "Rp 100.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(Kemeja2()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Kemeja RJNS"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // nEVADA
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 152, 179),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 190,
                            height: 260,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/nevada.PNG",
                                ),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Nevada",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Image(
                            width: 130,
                            height: 27,
                            image: AssetImage("assets/bintang.png"),
                          ),
                          Text(
                            "Rp 200.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () => Get.to(Kemeja3()),
                                  child: Text(
                                    'Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8);
                                    }),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      return Color.fromARGB(255, 145, 75, 109);
                                    }),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) {
                                      return StadiumBorder();
                                    }),
                                  ),
                                  onPressed: () {
                                    final psk = SnackBar(
                                      content: Text(
                                        "Telah Ditambahkan Ke Favorite",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.pinkAccent,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(psk);
                                    wish.add({'Nama Baju': "Kemeja Nevada"});
                                  },
                                  child: Text(
                                    'Favorite',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/4b/e7/15/4be7153b42ea140ee0fa817725de91a1.gif"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class crud extends StatefulWidget {
//   @override
//   State<crud> createState() => _crudState();
// }

// class _crudState extends State<crud> {
//   final TextEditingController nameController = TextEditingController();

//   final TextEditingController ageController = TextEditingController();

//   final items = [
//     'Kucing',
//     'Anture',
//     'Aurora',
//     'Bele',
//     'Nial',
//     'Aliando',
//   ];

//   String? value;

//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//         value: item,
//         child: Text(
//           item,
//           style: TextStyle(
//             fontSize: 16,
//           ),
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection("users");

//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Keranjang',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             ListView(
//               children: [
//                 // VIEW DATA HERE
//                 StreamBuilder<QuerySnapshot>(
//                   stream: users.snapshots(),
//                   builder: (_, snapshot) {
//                     return (snapshot.hasData)
//                         ? Column(
//                             children: snapshot.data!.docs
//                                 .map(
//                                   (e) => ItemCard(
//                                     e.get('name'),
//                                     e.get('age'),
//                                     onUpdate: () {
//                                       users.doc(e.id).update(
//                                         {'age': e.get('age') + 1},
//                                       );
//                                     },
//                                     onDelete: () {
//                                       users.doc(e.id).delete();
//                                     },
//                                   ),
//                                 )
//                                 .toList(),
//                           )
//                         : Text('Loading...');
//                   },
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => const ()),
//                     // );
//                   },
//                   child: Text('Checkout'),
//                 ),
//                 SizedBox(height: 150),
//               ],
//             ),
//             Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                     BoxShadow(
//                         color: Colors.black12,
//                         offset: Offset(-5, 0),
//                         blurRadius: 15,
//                         spreadRadius: 3)
//                   ]),
//                   width: double.infinity,
//                   height: 130,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width - 160,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             DropdownButton<String>(
//                               hint: Text('Pilih Jenis Baju'),
//                               iconSize: 36,
//                               isExpanded: true,
//                               items: items.map(buildMenuItem).toList(),
//                               value: value,
//                               onChanged: (value) =>
//                                   setState(() => this.value = value),
//                             ),
//                             // TextField(
//                             //   controller: nameController,
//                             //   decoration: InputDecoration(
//                             //       hintText: "Jenis baju dipesan"),
//                             // ),
//                             TextField(
//                               controller: ageController,
//                               decoration:
//                                   InputDecoration(hintText: "Jumlah Baju"),
//                               keyboardType: TextInputType.number,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 130,
//                         width: 130,
//                         padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
//                         child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: Text(
//                               'Add Data',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             onPressed: () {
//                               // ADD DATA HERE
//                               users.add({
//                                 'name': value,
//                                 'age': int.tryParse(ageController.text) ?? -1,
//                               });

//                               nameController.text = '';
//                               ageController.text = '';
//                             }),
//                       )
//                     ],
//                   ),
//                 )),
//           ],
//         ));
//   }
// }

// class FourPage extends StatelessWidget {
//   const FourPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Detail Product",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 244, 243, 240),
//           ),
//         ),
//         backgroundColor: Color.fromARGB(255, 221, 55, 111),
//       ),
//     );
//   }
// }
// class FourPage extends StatelessWidget {
//   const FourPage({Key? key}) : super(key: key);

//   // static final List<Widget> tabBar = [
//   //   Tab(text: "."),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Detail Product",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 244, 243, 240),
//           ),
//         ),
//         backgroundColor: Color.fromARGB(255, 221, 55, 111),
//       ),
//     );

// ignore: unnecessary_new
// floatingActionButton: new FloatingActionButton(
//   child: new Icon(Icons.fullscreen_exit),
//   onPressed: () {
//     Navigator.pushReplacementNamed(context, "/");
//   },
// ),
// body: ListView(children: [
//   Stack(
//     children: <Widget>[
//       Container(
//           height: MediaQuery.of(context).size.height - 20.0,
//           width: MediaQuery.of(context).size.width,
//           color: Color.fromARGB(255, 212, 130, 158)),
//       Positioned(
//           top: MediaQuery.of(context).size.height / 2,
//           child: Container(
//               height: MediaQuery.of(context).size.height / 2 - 20.0,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(40.0),
//                       topLeft: Radius.circular(40.0)),
//                   color: Colors.white))),

//       //Content
//       Positioned(
//           top: MediaQuery.of(context).size.height / 2 + 25.0,
//           left: 15.0,
//           child: Container(
//               height: (MediaQuery.of(context).size.height / 2) - 50.0,
//               width: MediaQuery.of(context).size.width,
//               child: ListView(children: [
//                 Text(
//                   'Aplikasi',
//                   style: TextStyle(
//                       fontFamily: 'nunito',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF726B68)),
//                 ),
//                 SizedBox(height: 7.0),
//                 Text(
//                   'Shopee, Instagram, Facebook',
//                   style: TextStyle(
//                       fontFamily: 'nunito',
//                       fontSize: 14.0,
//                       color: Color.fromARGB(255, 150, 148, 148)),
//                 ),
//                 SizedBox(height: 10.0),
//                 //This is the line
//                 Padding(
//                   padding: const EdgeInsets.only(right: 35.0),
//                   child: Container(
//                     height: 0.5,
//                     color: Color.fromARGB(255, 150, 148, 148),
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'Size',
//                   style: TextStyle(
//                       fontFamily: 'nunito',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF726B68)),
//                 ),
//                 Text(
//                   'S, M, L, XL, XXL',
//                   style: TextStyle(
//                       fontFamily: 'nunito',
//                       fontSize: 14.0,
//                       color: Color.fromARGB(255, 150, 148, 148)),
//                 ),
//                 Container(
//                     height: 10.0,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                     )),
//                 //Line
//                 Padding(
//                   padding: const EdgeInsets.only(right: 35.0),
//                   child: Container(
//                     height: 0.5,
//                     color: Color.fromARGB(255, 150, 148, 148),
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'Produk',
//                   style: TextStyle(
//                       fontFamily: 'nunito',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF726B68)),
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(children: [
//                   Text(
//                     'Ukuran',
//                     style: TextStyle(
//                         fontFamily: 'nunito',
//                         fontSize: 14.0,
//                         color: Color.fromARGB(255, 150, 148, 148)),
//                   ),
//                   SizedBox(width: 15.0),
//                   Text(
//                     'S, M, L',
//                     style: TextStyle(
//                         fontFamily: 'nunito',
//                         fontSize: 12.0,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF716966)),
//                   ),
//                 ]),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text(
//                       'S, M, L',
//                       style: TextStyle(
//                           fontFamily: 'nunito',
//                           fontSize: 14.0,
//                           color: Color.fromARGB(255, 150, 148, 148)),
//                     ),
//                     SizedBox(width: 15.0),
//                     Text(
//                       'Pink , Merah, Kuning, Hijau, Hitam',
//                       style: TextStyle(
//                           fontFamily: 'nunito',
//                           fontSize: 12.0,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF716966)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text(
//                       'Diskon',
//                       style: TextStyle(
//                           fontFamily: 'nunito',
//                           fontSize: 14.0,
//                           color: Color.fromARGB(255, 150, 148, 148)),
//                     ),
//                     SizedBox(width: 15.0),
//                     Text(
//                       '30 %',
//                       style: TextStyle(
//                           fontFamily: 'nunito',
//                           fontSize: 12.0,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF716966)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 15.0),
//                 //Line
//                 Padding(
//                   padding: const EdgeInsets.only(right: 35.0),
//                   child: Container(
//                     height: 0.5,
//                     color: Color.fromARGB(255, 150, 148, 148),
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     padding:
//                         MaterialStateProperty.resolveWith((states) {
//                       return const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 8);
//                     }),
//                     backgroundColor:
//                         MaterialStateColor.resolveWith((states) {
//                       return const Color.fromARGB(255, 221, 55, 111);
//                     }),
//                     shape: MaterialStateProperty.resolveWith((states) {
//                       return StadiumBorder();
//                     }),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) {
//                           return crud();
//                         },
//                       ),
//                     );
//                   },
//                   child: Text(
//                     'Pesan Sekarang',
//                   ),
//                 ),

//                 SizedBox(height: 5.0)
//               ]))),

//       Positioned(
//           top: MediaQuery.of(context).size.height / 10,
//           right: 95.0,
//           child: Container(
//               height: 200.0,
//               width: 200.0,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(10.0),
//                       topLeft: Radius.circular(10.0)),
//                   image: DecorationImage(
//                       image: AssetImage('logo.jpeg'),
//                       fit: BoxFit.cover)))),
//       Positioned(
//           top: 25.0,
//           left: 15.0,
//           child: Container(
//               height: 300.0,
//               width: 250.0,
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     //use a row with crossaxis as end
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: <Widget>[
//                         Container(
//                           width: 150.0,
//                           child: Text('Thrifting Shop',
//                               style: TextStyle(
//                                   fontFamily: 'varela',
//                                   fontSize: 30.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                         ),
//                         SizedBox(width: 15.0),
//                       ],
//                     ),
//                     SizedBox(height: 10.0),
//                     Container(
//                       width: 170.0,
//                       child: Text(
//                           'Dapatkan Koleksi Fashion Terbaru & Berkualitas dengan Harga Terbaik dari toko rofiqah Indonesia. Segera Miliki Pakaian anak-anak dari toko rofiqah dengan Kualitas & Harga Terbaik. Banyak Promo Menarik. Gratis Ongkir. Kualitas Terbaik. Harga Terjangkau. Models: Modern Classic, Denim.',
//                           textAlign: TextAlign.justify,
//                           style: TextStyle(
//                               fontFamily: 'nunito',
//                               fontSize: 13.0,
//                               color: Colors.white)),
//                     ),
//                     SizedBox(height: 20.0),
//                     Row(children: [
//                       Container(
//                           height: 60.0,
//                           width: 60.0,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30.0),
//                               color: Color(0xFF473D3A)),
//                           child: Center(
//                               child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Text('4.2',
//                                   style: TextStyle(
//                                       fontFamily: 'nunito',
//                                       fontSize: 13.0,
//                                       color: Colors.white)),
//                               Text('/5',
//                                   style: TextStyle(
//                                       fontFamily: 'nunito',
//                                       fontSize: 13.0,
//                                       color: Color(0xFF7C7573))),
//                             ],
//                           ))),
//                       SizedBox(width: 15.0),
//                       Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Stack(children: [
//                               Container(height: 35.0, width: 80.0),
//                               Positioned(
//                                   left: 40.0,
//                                   child: Container(
//                                       height: 35.0,
//                                       width: 35.0,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(
//                                                   17.5),
//                                           border: Border.all(
//                                               color: Color(0xFFF3B2B7),
//                                               style: BorderStyle.solid,
//                                               width: 1.0),
//                                           image: DecorationImage(
//                                               image: AssetImage(
//                                                   'assets/cowo3.jpg'),
//                                               fit: BoxFit.cover)))),
//                               Positioned(
//                                 left: 20.0,
//                                 child: Container(
//                                   height: 35.0,
//                                   width: 35.0,
//                                   decoration: BoxDecoration(
//                                       borderRadius:
//                                           BorderRadius.circular(17.5),
//                                       image: DecorationImage(
//                                           image:
//                                               AssetImage('logo.jpeg'),
//                                           fit: BoxFit.cover),
//                                       border: Border.all(
//                                           color: Color(0xFFF3B2B7),
//                                           style: BorderStyle.solid,
//                                           width: 1.0)),
//                                 ),
//                               ),
//                               Container(
//                                 height: 35.0,
//                                 width: 35.0,
//                                 decoration: BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.circular(17.5),
//                                     image: DecorationImage(
//                                         image: AssetImage(
//                                             'assets/kaos2.jpg'),
//                                         fit: BoxFit.cover),
//                                     border: Border.all(
//                                         color: Color(0xFFF3B2B7),
//                                         style: BorderStyle.solid,
//                                         width: 1.0)),
//                               ),
//                             ]),
//                             SizedBox(height: 3.0),
//                             Text(
//                               '+ 20 more',
//                               style: TextStyle(
//                                   fontFamily: 'nunito',
//                                   fontSize: 12.0,
//                                   color: Colors.white),
//                             )
//                           ])
//                     ])
//                   ])))
//     ],
//   )
// ]));
// }

//   buildIngredientItem(String name, Icon iconName, Color bgColor) {
//     return Padding(
//         padding: EdgeInsets.only(right: 10.0),
//         child: Column(children: [
//           Container(
//               height: 50.0,
//               width: 50.0,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0), color: bgColor),
//               child: Center(child: iconName)),
//           SizedBox(height: 4.0),
//           Container(
//               width: 60.0,
//               child: Center(
//                   child: Text(name,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontFamily: 'nunito',
//                           fontSize: 12.0,
//                           color: Color(0xFFC2C0C0)))))
//         ]));
//   }
// }

// class FivePage extends StatelessWidget {
//   const FivePage({Key? key}) : super(key: key);

//   static final List<Widget> tabBar = [
//     Tab(text: "."),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Detail Product",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Color.fromARGB(255, 244, 243, 240),
//             ),
//           ),
//           actions: [
//             Icon(Icons.favorite),
//             Icon(Icons.more_vert),
//           ],
//           backgroundColor: Color.fromARGB(255, 221, 55, 111),
//         ),
//         body: ListView(children: [
//           Stack(
//             children: <Widget>[
//               Container(
//                   height: MediaQuery.of(context).size.height - 20.0,
//                   width: MediaQuery.of(context).size.width,
//                   color: Color.fromARGB(255, 212, 130, 158)),
//               Positioned(
//                   top: MediaQuery.of(context).size.height / 2,
//                   child: Container(
//                       height: MediaQuery.of(context).size.height / 2 - 20.0,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(40.0),
//                               topLeft: Radius.circular(40.0)),
//                           color: Colors.white))),

//               //Content
//               Positioned(
//                   top: MediaQuery.of(context).size.height / 2 + 25.0,
//                   left: 15.0,
//                   child: Container(
//                       height: (MediaQuery.of(context).size.height / 2) - 50.0,
//                       width: MediaQuery.of(context).size.width,
//                       child: ListView(children: [
//                         Text(
//                           'Aplikasi',
//                           style: TextStyle(
//                               fontFamily: 'nunito',
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF726B68)),
//                         ),
//                         SizedBox(height: 7.0),
//                         Text(
//                           'Shopee, Instagram, Facebook',
//                           style: TextStyle(
//                               fontFamily: 'nunito',
//                               fontSize: 14.0,
//                               color: Color.fromARGB(255, 150, 148, 148)),
//                         ),
//                         SizedBox(height: 10.0),
//                         //This is the line
//                         Padding(
//                           padding: const EdgeInsets.only(right: 35.0),
//                           child: Container(
//                             height: 0.5,
//                             color: Color.fromARGB(255, 150, 148, 148),
//                           ),
//                         ),
//                         SizedBox(height: 10.0),
//                         Text(
//                           'Size',
//                           style: TextStyle(
//                               fontFamily: 'nunito',
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF726B68)),
//                         ),
//                         Text(
//                           'S,M,L,XL,XXL',
//                           style: TextStyle(
//                               fontFamily: 'nunito',
//                               fontSize: 14.0,
//                               color: Color.fromARGB(255, 150, 148, 148)),
//                         ),
//                         Container(
//                             height: 10.0,
//                             child: ListView(
//                               scrollDirection: Axis.horizontal,
//                             )),
//                         //Line
//                         Padding(
//                           padding: const EdgeInsets.only(right: 35.0),
//                           child: Container(
//                             height: 0.5,
//                             color: Color.fromARGB(255, 150, 148, 148),
//                           ),
//                         ),
//                         SizedBox(height: 10.0),
//                         Text(
//                           'Produk',
//                           style: TextStyle(
//                               fontFamily: 'nunito',
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF726B68)),
//                         ),
//                         SizedBox(height: 10.0),
//                         Row(children: [
//                           Text(
//                             'Diskon',
//                             style: TextStyle(
//                                 fontFamily: 'nunito',
//                                 fontSize: 14.0,
//                                 color: Color.fromARGB(255, 150, 148, 148)),
//                           ),
//                           SizedBox(width: 15.0),
//                           Text(
//                             'S, M, L',
//                             style: TextStyle(
//                                 fontFamily: 'nunito',
//                                 fontSize: 12.0,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF716966)),
//                           ),
//                         ]),
//                         SizedBox(height: 10.0),
//                         Row(
//                           children: <Widget>[
//                             Text(
//                               'warna ',
//                               style: TextStyle(
//                                   fontFamily: 'nunito',
//                                   fontSize: 14.0,
//                                   color: Color.fromARGB(255, 150, 148, 148)),
//                             ),
//                             SizedBox(width: 15.0),
//                             Text(
//                               'Pink , merah, kuning, hijau, hitam',
//                               style: TextStyle(
//                                   fontFamily: 'nunito',
//                                   fontSize: 12.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF716966)),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10.0),
//                         Row(
//                           children: <Widget>[
//                             Text(
//                               'Diskon',
//                               style: TextStyle(
//                                   fontFamily: 'nunito',
//                                   fontSize: 14.0,
//                                   color: Color.fromARGB(255, 150, 148, 148)),
//                             ),
//                             SizedBox(width: 15.0),
//                             Text(
//                               '30 %',
//                               style: TextStyle(
//                                   fontFamily: 'nunito',
//                                   fontSize: 12.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF716966)),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 15.0),
//                         //Line
//                         Padding(
//                           padding: const EdgeInsets.only(right: 35.0),
//                           child: Container(
//                             height: 0.5,
//                             color: Color.fromARGB(255, 150, 148, 148),
//                           ),
//                         ),
//                         SizedBox(height: 10.0),
//                         ElevatedButton(
//                           style: ButtonStyle(
//                             padding:
//                                 MaterialStateProperty.resolveWith((states) {
//                               return const EdgeInsets.symmetric(
//                                   horizontal: 18, vertical: 8);
//                             }),
//                             backgroundColor:
//                                 MaterialStateColor.resolveWith((states) {
//                               return const Color.fromARGB(255, 221, 55, 111);
//                             }),
//                             shape: MaterialStateProperty.resolveWith((states) {
//                               return StadiumBorder();
//                             }),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) {
//                                   return crud();
//                                 },
//                               ),
//                             );
//                           },
//                           child: Text(
//                             'Pesan Sekarang',
//                           ),
//                         ),

//                         SizedBox(height: 5.0)
//                       ]))),

//               Positioned(
//                   top: MediaQuery.of(context).size.height / 10,
//                   right: 95.0,
//                   child: Container(
//                       height: 200.0,
//                       width: 200.0,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(10.0),
//                               topLeft: Radius.circular(10.0)),
//                           image: DecorationImage(
//                               image: AssetImage('pesta2.jpg'),
//                               fit: BoxFit.cover)))),
//               Positioned(
//                   top: 25.0,
//                   left: 15.0,
//                   child: Container(
//                       height: 300.0,
//                       width: 250.0,
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             //use a row with crossaxis as end
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: <Widget>[
//                                 Container(
//                                   width: 150.0,
//                                   child: Text('Thrifting Shop',
//                                       style: TextStyle(
//                                           fontFamily: 'varela',
//                                           fontSize: 30.0,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white)),
//                                 ),
//                                 SizedBox(width: 15.0),
//                               ],
//                             ),
//                             SizedBox(height: 10.0),
//                             Container(
//                               width: 170.0,
//                               child: Text(
//                                   'Dapatkan Koleksi Fashion Terbaru & Berkualitas dengan Harga Terbaik dari toko rofiqah Indonesia. Segera Miliki Pakaian anak-anak dari toko rofiqah dengan Kualitas & Harga Terbaik. Banyak Promo Menarik. Gratis Ongkir. Kualitas Terbaik. Harga Terjangkau. Models: Modern Classic, Denim.',
//                                   style: TextStyle(
//                                       fontFamily: 'nunito',
//                                       fontSize: 13.0,
//                                       color: Colors.white)),
//                             ),
//                             SizedBox(height: 20.0),
//                             Row(children: [
//                               Container(
//                                   height: 60.0,
//                                   width: 60.0,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       color: Color(0xFF473D3A)),
//                                   child: Center(
//                                       child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//                                       Text('4.2',
//                                           style: TextStyle(
//                                               fontFamily: 'nunito',
//                                               fontSize: 13.0,
//                                               color: Colors.white)),
//                                       Text('/5',
//                                           style: TextStyle(
//                                               fontFamily: 'nunito',
//                                               fontSize: 13.0,
//                                               color: Color(0xFF7C7573))),
//                                     ],
//                                   ))),
//                               SizedBox(width: 15.0),
//                               Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Stack(children: [
//                                       Container(height: 35.0, width: 80.0),
//                                       Positioned(
//                                           left: 40.0,
//                                           child: Container(
//                                               height: 35.0,
//                                               width: 35.0,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           17.5),
//                                                   border: Border.all(
//                                                       color: Color(0xFFF3B2B7),
//                                                       style: BorderStyle.solid,
//                                                       width: 1.0),
//                                                   image: DecorationImage(
//                                                       image: AssetImage(
//                                                           'assets/cowo3.jpg'),
//                                                       fit: BoxFit.cover)))),
//                                       Positioned(
//                                         left: 20.0,
//                                         child: Container(
//                                           height: 35.0,
//                                           width: 35.0,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(17.5),
//                                               image: DecorationImage(
//                                                   image:
//                                                       AssetImage('logo.jpeg'),
//                                                   fit: BoxFit.cover),
//                                               border: Border.all(
//                                                   color: Color(0xFFF3B2B7),
//                                                   style: BorderStyle.solid,
//                                                   width: 1.0)),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 35.0,
//                                         width: 35.0,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(17.5),
//                                             image: DecorationImage(
//                                                 image: AssetImage(
//                                                     'assets/kaos2.jpg'),
//                                                 fit: BoxFit.cover),
//                                             border: Border.all(
//                                                 color: Color(0xFFF3B2B7),
//                                                 style: BorderStyle.solid,
//                                                 width: 1.0)),
//                                       ),
//                                     ]),
//                                     SizedBox(height: 3.0),
//                                     Text(
//                                       '+ 20 more',
//                                       style: TextStyle(
//                                           fontFamily: 'nunito',
//                                           fontSize: 12.0,
//                                           color: Colors.white),
//                                     )
//                                   ])
//                             ])
//                           ])))
//             ],
//           )
//         ]));
//   }

//   buildIngredientItem(String name, Icon iconName, Color bgColor) {
//     return Padding(
//         padding: EdgeInsets.only(right: 10.0),
//         child: Column(children: [
//           Container(
//               height: 50.0,
//               width: 50.0,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0), color: bgColor),
//               child: Center(child: iconName)),
//           SizedBox(height: 4.0),
//           Container(
//               width: 60.0,
//               child: Center(
//                   child: Text(name,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontFamily: 'nunito',
//                           fontSize: 12.0,
//                           color: Color(0xFFC2C0C0)))))
//         ]));
//   }
// }

class pesta extends StatelessWidget {
  const pesta({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Brokat, Moscrepe',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Putih,Cream,Coklat',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '5%',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),

                        SizedBox(height: 5.0)
                      ]))),
              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Dress Ohana',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/pesta9.PNG"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Dress Ohana adalah dress dengan dua bahan yaitu bahan brokat yang dilapisi dengan furing dikaranekan sifatnya yang semitransparan dan dengan bahan Moscrepe, bahan yang tidak mudah kusut',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

class pesta3 extends StatelessWidget {
  const pesta3({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Brokat',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Putih,Pink, Coklat',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '-',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0)
                      ]))),
              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Dress Moazam',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/pesta3.jpg"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Dress Moazam adalah dress dengan bahan brokat yang dilapisi dengan furing dikaranekan sifatnya yang semitransparan dan memiliki pola rumit sehingga menciptkan tampilan yang  berkelas',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

class pesta4 extends StatelessWidget {
  const pesta4({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Maxmara',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Pink , Purple, Hijau, Biru',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '5 %',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return const Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0)
                      ]))),

              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Dress Rofi',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/pesta4.jpg"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Dress Rofi adalah dress dari bahan Maxmara, bahan ini memiliki tekstur yang halus dan lembut serta banyak diminati oleh kaum hawa karena memiliki motif yang unik dan cantik',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

//julia dres
class pesta5 extends StatelessWidget {
  const pesta5({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),
              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),
              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),

                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),

                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Crape',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Pink',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),

                        SizedBox(height: 5.0)
                      ]))),
              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Dress Julia',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/pesta8.PNG"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Dress Julia adalah Dress dari bahan kain Crepe yang memiliki tekstur yang lembut berserat dan jatuh saat dipakai,tidak menerawang serta tidak membuat gerah saat dipakai',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

class Kaos extends StatelessWidget {
  const Kaos({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Kasmir',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Merah, Putih,Hitam',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '-',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return const Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0)
                      ]))),

              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Kaos Gucci',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/gucci.PNG"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Kaos Gucci adalah kaos yang terbuat dari bahan kasmir karena kasmir adalah salah satu bahan yang paling populer dalam pakaian desainer serta tahan lama,nyaman dan enak dipandang',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

class Kaos1 extends StatelessWidget {
  const Kaos1({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Supima Cotton',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Pink , Putih',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '5 %',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return const Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),

                        SizedBox(height: 5.0)
                      ]))),

              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Kaos Hermes',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/hermes.PNG"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Kaos Hermes adalah baju yang terbuat dari bahan supima Cotton atau katun supima yang memiliki kualitas lebih tinggi dan eksklusif produksinya',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

class Kaos2 extends StatelessWidget {
  const Kaos2({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Cotton Combed',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Pink , Hitam',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '-',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return const Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),

                        SizedBox(height: 5.0)
                      ]))),

              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Kaos Dior',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/dior.PNG"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Kemeja Dior adalah baju yang terbuat dari bahan cotton combed dengan teksturnya yang lembut dan juga ketahanannya yang awet serta proses penghalusan benang dengan sangat baik',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

class Kaos3 extends StatelessWidget {
  const Kaos3({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Modal',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Pink , Merah, Kuning, Hijau, Hitam',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '10 %',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return const Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),

                        SizedBox(height: 5.0)
                      ]))),

              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Kaos Balenciaga',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/balenciaga.PNG"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Kaos Balenciaga adalah kaos dengan bahan modal yang terbuat dari serat kayu yang sangat lembut serta memiliki aliran pertukaran udara yang baik dan juga baik dalam menyerap keringat',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

class Kemeja extends StatelessWidget {
  const Kemeja({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Shopee, Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Blends',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Pink , Merah, Kuning, Hijau, Hitam',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '-',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return const Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0)
                      ]))),

              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Kemeja Davis',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/davis.PNG"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Kemeja Davis adalah baju yang terbuat dari bahan blends merupakan bahan campuran dari dua bahan kaos yang lebih umum digunakan dan memiliki karakteristik bahan yang dingin dan nyaman saat digunakan.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

class Kemeja1 extends StatelessWidget {
  const Kemeja1({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Shopee, Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Produk',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Linen',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Pink , Merah, Kuning, Hijau, Hitam',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '15 %',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return const Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0)
                      ]))),

              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Kemeja ADS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/ads.PNG"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Kemeja ADS adalah baju yang terbuat dari bahan linen yang berkualitas dengan harga yang terjangkau,bahan ini juga menyerap keringat dan memiliki ketahanan 30% serta cocok digunakan di segala musim',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

class Kemeja2 extends StatelessWidget {
  const Kemeja2({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Cotton Combed',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Pink , Merah, Kuning, Hijau, Hitam',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '30 %',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return const Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),

                        SizedBox(height: 5.0)
                      ]))),
              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Kemeja RJNS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/rjns.PNG"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Kemeja RJNS adalah baju yang terbuat dari bahan cotton combed,karena teksturnya yang lembut dan ketahanannya yang awet sehingga sangat cocok digunakan anak-anak',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}

class Kemeja3 extends StatelessWidget {
  const Kemeja3({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 244, 243, 240),
            ),
          ),
          actions: [
            Icon(Icons.favorite),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 104, 76, 95),
        ),
        body: ListView(children: [
          Stack(
            children: <Widget>[
              Container(
                height: 620,
                width: 1000,
                color: Color.fromARGB(255, 212, 130, 158),
              ),

              Positioned(
                  top: 300,
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white))),

              //Content

              Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 25.0,
                  left: 15.0,
                  child: Container(
                      height: (MediaQuery.of(context).size.height / 2) - 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(children: [
                        Text(
                          'Sosial Media',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          'Instagram, Facebook',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        SizedBox(height: 10.0),
                        //This is the line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        Text(
                          'S, M, L, XL, XXL',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 150, 148, 148)),
                        ),
                        Container(
                            height: 10.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                            )),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF726B68)),
                        ),
                        SizedBox(height: 10.0),
                        Row(children: [
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 150, 148, 148)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Katun',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Warna',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              'Pink , Merah, Kuning, Hijau, Hitam',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diskon',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              '30 %',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF716966)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        //Line
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Container(
                            height: 0.5,
                            color: Color.fromARGB(255, 150, 148, 148),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [],
                        ),

                        Container(
                          width: 50,
                          height: 45,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 2);
                              }),
                              backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return const Color.fromARGB(255, 179, 73, 124);
                              }),
                              shape:
                                  MaterialStateProperty.resolveWith((states) {
                                return StadiumBorder();
                              }),
                            ),
                            onPressed: () => Get.to(pesan()),
                            child: Text(
                              'Pesan Sekarang',
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0)
                      ]))),

              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                      height: 1000.0,
                      width: 350.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //use a row with crossaxis as end
                            Container(
                              width: 300,
                              child: Text('Kemeja Nevada',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 10.0),

                            Container(
                              height: 150,
                              width: 300,
                              alignment: Alignment.center,
                              child: Image.asset("assets/nevada.PNG"),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 100,
                              width: 280,
                              child: Text(
                                  'Kemeja Nevada adalah baju yang terbuat dari bahan katun yang lembut,sangat cocok untuk digunakan anak-anak ketika beraktivitas',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Colors.white)),
                            ),
                          ])))
            ],
          )
        ]));
  }
}
