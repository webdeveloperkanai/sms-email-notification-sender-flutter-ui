import 'package:flutter/material.dart';
import 'package:sms_sender/main.dart';
import 'package:sms_sender/sendMail.dart';
import 'package:sms_sender/sendNotification.dart';
import 'package:sms_sender/sendSMS.dart';

AppBar myAppBar(title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    foregroundColor: Colors.white,
    backgroundColor: Color.fromARGB(255, 97, 4, 105),
    elevation: 1,
  );
}

Container myDrawer(BuildContext context, uid) {
  return Container(
    width: MediaQuery.of(context).size.width - 50,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("Mr. Kanai"),
          accountEmail: Text("email@gmail.com"),
          currentAccountPicture: CircleAvatar(
            child: Text("K"),
          ),
        ),
        ListTile(
          title: const Text("Dashboard"),
          leading: const Icon(Icons.home_filled),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => MyHomePage(uid: uid,)));
          },
        ),
        ListTile(
          title: const Text("Send SMS"),
          leading: const Icon(Icons.message),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => SendSMS(
                          uid: uid,
                        )));
          },
        ),
        ListTile(
          title: const Text("Send Mail"),
          leading: const Icon(Icons.mail),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SendMail()));
          },
        ),
        ListTile(
          title: const Text("Send Notification"),
          leading: const Icon(Icons.notifications),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SendNotification()));
          },
        ),
        const Divider(),
        ListTile(
          title: const Text("My Profile"),
          leading: const Icon(Icons.settings),
          onTap: () {},
        ),
        ListTile(
          title: const Text("My Balance"),
          leading: const Icon(Icons.attach_money_outlined),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Refer & Earn"),
          leading: const Icon(Icons.share),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Play Games"),
          leading: const Icon(Icons.play_circle_outline_outlined),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          title: const Text("About Us"),
          leading: const Icon(Icons.align_vertical_bottom_outlined),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Contact Us"),
          leading: const Icon(Icons.phone_in_talk_rounded),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          title: const Text("Account Logout"),
          leading: const Icon(Icons.logout),
          onTap: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15, bottom: 35),
          child: Text("App v1.4.3"),
        ),
      ],
    ),
  );
}
