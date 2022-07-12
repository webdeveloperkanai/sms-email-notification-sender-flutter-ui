import 'package:flutter/material.dart';

Future<dynamic> successDialog(BuildContext context, title) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Container(
            height: 35,
            child: Text(title),
          ),
          actions: [
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Okay",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      });
}
 