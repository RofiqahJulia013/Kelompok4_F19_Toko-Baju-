import 'package:get/get.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/auth.dart';
import 'package:flutter/material.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/flutter_fire.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/flutter_fire2.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/main.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/main_page.dart';

class authentification extends StatefulWidget {
  const authentification({Key? key}) : super(key: key);

  @override
  State<authentification> createState() => _authentificationState();
}

class _authentificationState extends State<authentification> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color.fromARGB(255, 126, 94, 124)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _emailField,
                decoration: InputDecoration(
                  hintText: 'namaemailkamu@gmail.com',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: "e-mail",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: MaterialButton(
                onPressed: () async {
                  if (_emailField.text == "" || _passwordField.text == "") {
                    CustomAlert(context, "MASUKKAN EMAIL/PASSWORD");
                  } else {
                    bool shouldNavigate =
                        await register(_emailField.text, _passwordField.text);
                    if (shouldNavigate == true) {
                      Get.snackbar('Registrasi berhasil~', 'Silahkan Login~');
                    } else {
                      Get.snackbar('Registrasi Gagal!',
                          'Email sudah terdaftar,Silahkan Registrasi ulang!');
                    }
                  }
                },
                child: Text("Register"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width / 35),
            Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: MaterialButton(
                  onPressed: () async {
                    if (_emailField.text == "" || _passwordField.text == "") {
                      CustomAlert(context, "MASUKKAN EMAIL/PASSWORD");
                    } else {
                      bool shouldNavigate =
                          await signIn(_emailField.text, _passwordField.text);
                      if (shouldNavigate) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ));
                      } else if (shouldNavigate) {}
                    }
                  },
                  child: Text("Login"),
                ))
          ],
        ),
      ),
    );
  }
}
