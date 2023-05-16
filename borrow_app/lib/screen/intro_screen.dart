import 'package:borrow_app/screen/LoginPage.dart';
import 'package:borrow_app/utils/color.dart';
import 'package:borrow_app/utils/utils.dart';
import 'package:borrow_app/widget/check_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/image_list_view.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  // String? role;
  // Future getDataRole() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   if (snapshot.exists) {
  //     setState(() {
  //       role = snapshot.get("role");
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            // image transition
            Positioned(
              top: -10,
              left: -150,
              child: Row(
                children: const [
                  ImageListView(starIndex: 0),
                  ImageListView(starIndex: 1),
                  ImageListView(starIndex: 2),
                ],
              ),
            ),
            //title
            Positioned(
              top: MediaQuery.of(context).size.height * 0.08,
              child: const Text(
                'BORROW ',
                textAlign: TextAlign.center,
                style: kTitleStyle,
              ),
            ), // information screen
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white60,
                      Colors.white,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You can Borrow\n Show Your Quality',
                      style: kNormalStyle.copyWith(
                        fontSize: 30,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'You can Borrow\n Show Your Quality',
                      style: kNormalStyle.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildIndicators(),
                    )
                  ],
                ),
              ),
            ),
            //bottom button
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckUser(),
                    ),
                  ),
                  child: const Text('Start Here'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
