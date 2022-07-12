import 'package:flutter/material.dart';
import 'package:sms_sender/parts.dart';

class SendNotification extends StatefulWidget {
  const SendNotification({Key? key}) : super(key: key);

  @override
  State<SendNotification> createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("SEND NOTIFICATION"),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter title",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: const BorderSide(),
                ),
                //fillColor: Colors.green
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "Enter body",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide(),
                ),
                //fillColor: Colors.green
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "SEND NOTIFICATION",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  )))),
            )
          ],
        ),
      ),
    );
  }
}
