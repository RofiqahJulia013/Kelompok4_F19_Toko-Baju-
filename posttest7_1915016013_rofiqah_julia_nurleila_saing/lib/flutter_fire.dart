import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:posttest7_1915016013_rofiqah_julia_nurleila_saing/flutter_fire2.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('the password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('the account already exists for that email');
    }
    return false;
  }
  // catch (e) {
  //   print(e.toString());
  //   return false;
  // }
}

// void submit(BuildContext context, String email, String password) {
//   if (email.isEmpty || password.isEmpty) {
//     final snackBar = SnackBar(
//       duration: const Duration(seconds: 5),
//       content: Text("Email dan password harus diisi"),
//       backgroundColor: Colors.red,
//     );

//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     return;
//   }

//   AlertDialog alert = AlertDialog(
//     title: Text("Login Berhasil"),
//     content: Container(
//       child: Text("Selamat Anda Berhasil login"),
//     ),
//     actions: [
//       TextButton(
//         child: Text('Ok'),
//         onPressed: () => Navigator.of(context).pop(),
//       ),
//     ],
//   );

//   showDialog(context: context, builder: (context) => alert);
//   return;
// }