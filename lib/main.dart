import 'package:flutter/material.dart';
import 'package:sms_sender/config.dart';
import 'package:sms_sender/sendSMS.dart';

import 'parts.dart';
import 'parts/infoBox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: const Color.fromARGB(255, 97, 4, 105),
          hoverColor: Colors.black),
      home: MyHomePage(uid: 1),
    );
  }
}

class MyHomePage extends StatefulWidget {
  var uid;
  MyHomePage({Key? key, required this.uid}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(APP_NAME),
      drawer: myDrawer(context, 3),
      body: ListView(
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        children: [
          infoBox(context, "Balance", "155.30"),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SendSMS(uid: widget.uid)));
              },
              child: infoBox(context, "SMS Sent", "161")),
          const SizedBox(
            height: 15,
          ),
          infoBox(context, "Mail Sent", "36"),
          const SizedBox(
            height: 15,
          ),
          infoBox(context, "Notification Sent", "65"),
          const SizedBox(
            height: 15,
          ),
          infoBox(context, "My Friends ", "6"),
        ],
      ),
    );
  }
}
