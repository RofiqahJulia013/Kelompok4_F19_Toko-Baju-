import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 104, 76, 95),
        title: Text('About'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color.fromARGB(255, 232, 190, 218),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  "ARRVi STORE ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 170, 60, 133),
                  ),
                ),
                Image(image: AssetImage('assets/wrg.png')),
                Text(
                  '      Toko Baju yang menjual baju-baju anak khusus cewek yang didatangkan langsung dari negara inggris. tentu dengan kualitas yang bagus\n\nFollow instagram dan Facebook kami untuk mendapat info pakaian yang lebih menarik di Arrvi Store :',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 69, 13, 71)),
                ),
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/fg.png"),
                    ),
                  ),
                ),
                Text(
                  " Instagram : @arrvi store ",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 190, 116, 188)),
                ),
                Text(
                  " Facebook : arrvi store ",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 190, 116, 188)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    "Berbelanja terus di Arrvi Store karena kami akan memberikan kupon berhadiah kepada teman-teman yang telah berbelanja di toko kami ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 82, 0, 54),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Hubungi kami Jika ada yang perlu ditanyakan ",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 69, 13, 71)),
                ),
                ListTile(
                  title: Text('081349062095'),
                  leading: Icon(Icons.call),
                ),
                SizedBox(height: 20)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
