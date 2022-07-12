import 'package:flutter/material.dart';
import 'package:sms_sender/parts.dart';
import 'package:http/http.dart' as http;

import 'config.dart';
import 'parts/successDialog.dart';
import 'parts/waitDialog.dart';

class SendSMS extends StatefulWidget {
  var uid;
  SendSMS({required this.uid, Key? key}) : super(key: key);

  @override
  State<SendSMS> createState() => _SendSMSState();
}

class _SendSMSState extends State<SendSMS> {
  TextEditingController _phone = TextEditingController();
  TextEditingController _message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("SEND SMS"),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter mobile no.",
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
                labelText: "Enter message",
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
                  onPressed: () async {
                    if (_phone.text.isNotEmpty && _message.text.isNotEmpty) {
                      print("Email - " + _phone.text);
                      print("subject - " + _message.text);
                      print("uid - " + widget.uid.toString());
                      waitDialog(context);
                      http.Response resp =
                          await http.post(Uri.parse(APP_SERVER), body: {
                        'sendSMS': 'true',
                        'phone': _phone.text,
                        'message': _message.text,
                        'uid': widget.uid.toString()
                      });
                      print("Response - " + resp.body.toString());
                      if (resp.body.toString() == "Sent") {
                        Navigator.pop(context);
                        successDialog(context, "Message sent !");
                        print("Message sent");
                      } else {
                        Navigator.pop(context);
                        print("Message sending failed");
                      }
                    }
                  },
                  child: const Text(
                    "SEND SMS",
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
