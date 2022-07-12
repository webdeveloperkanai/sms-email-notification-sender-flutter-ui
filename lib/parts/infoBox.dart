import 'package:flutter/material.dart';

import '../config.dart';

Container infoBox(BuildContext context, title, val) {
  return Container(
    height: 50,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: APP_COLOR,
    ),
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: EdgeInsets.only(left: 25),
          child: Text(
            title,
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
        Container(
          child: Text(
            ": $val",
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
        )
      ],
    ),
  );
}
