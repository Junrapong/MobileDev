import 'package:borrow_app/screen/HomeBar.dart';

import 'package:borrow_app/screen/changepss.dart';
import 'package:borrow_app/screen/faq.dart';
import 'package:borrow_app/screen/feedback.dart';
import 'package:borrow_app/screen/intro_screen.dart';
import 'package:borrow_app/widget/auth_service.dart';
import 'package:flutter/material.dart';

import '../constants/profile/profile_screen.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeBar()),
              ((route) => false),
            );
          },
          color: Colors.black, // <-- SEE HERE
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.1,
        title: const Text(
          'Setting',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: const Text("Profile"),
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      });
                    },
                  ),
                  // ListTile(
                  //   title: const Text("Change Password"),
                  //   leading: const Icon(Icons.lock),
                  //   trailing: const Icon(Icons.chevron_right),
                  //   onTap: () {
                  //     setState(() {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const ChangePassword()),
                  //       );
                  //     });
                  //   },
                  // ),
                  // ListTile(
                  //   title: const Text("Notification"),
                  //   leading: const Icon(Icons.notifications),
                  //   trailing: const Icon(Icons.chevron_right),
                  //   onTap: () {
                  //     setState(() {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const Notificationn()),
                  //       );
                  //     });
                  //   },
                  // ),
                  const Text(
                    'More',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    title: const Text("Report"),
                    leading: const Icon(Icons.report),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => UI22()),
                        );
                      });
                    },
                  ),
                  ListTile(
                    title: const Text("FAQ"),
                    leading: const Icon(Icons.help),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FAQ()),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      AuthService().signOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IntroScreen()),
                        ((route) => false),
                      );
                    });
                  },
                  child: Text('Logout'.toUpperCase())),
            ),
          ],
        ),
      ),
    );
  }
} //sad
