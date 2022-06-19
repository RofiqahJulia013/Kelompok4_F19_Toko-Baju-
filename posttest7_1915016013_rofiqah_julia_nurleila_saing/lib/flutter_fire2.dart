import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> CustomAlert(BuildContext context, String messenge) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("PERINGATAN!!"),
          content: Text(messenge),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK")),
          ],
        );
      });
}
