import 'package:flutter/material.dart';

Future<dynamic> waitDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Container(
            height: 45,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      });
}
