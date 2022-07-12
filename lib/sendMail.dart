import 'package:flutter/material.dart';
import 'package:sms_sender/config.dart';
import 'package:sms_sender/parts.dart';
import 'package:http/http.dart' as http;

import 'parts/successDialog.dart';
import 'parts/waitDialog.dart';

class SendMail extends StatefulWidget {
  const SendMail({Key? key}) : super(key: key);

  @override
  State<SendMail> createState() => _SendMailState();
}

class _SendMailState extends State<SendMail> {
  var uid = 3;
  TextEditingController email = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("SEND MAIL"),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Enter email id.",
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
              controller: subject,
              decoration: InputDecoration(
                labelText: "Enter email subject",
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
              controller: message,
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
                    if (email.text.isNotEmpty &&
                        subject.text.isNotEmpty &&
                        message.text.isNotEmpty) {
                      print("Email - " + email.text);
                      print("subject - " + subject.text);
                      print("message - " + message.text);
                      print("uid - " + uid.toString());
                      waitDialog(context);
                      http.Response resp =
                          await http.post(Uri.parse(APP_SERVER), body: {
                        'sendmail': 'true',
                        'email': email.text,
                        'subject': subject.text,
                        'message': message.text,
                        'uid': uid.toString()
                      });
                      print("Response - " + resp.body.toString());
                      if (resp.body.toString() == "Sent") {
                        Navigator.pop(context);
                        successDialog(context, "Mail sent !");
                        print("Mail sent");
                      } else {
                        Navigator.pop(context);
                        print("Mail sending failed");
                      }
                    }
                  },
                  child: const Text(
                    "SEND MAIL",
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
