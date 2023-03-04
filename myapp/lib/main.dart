import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Firebase_Demo/read_demo.dart';
import 'package:myapp/Lab5/Check.dart';
import 'package:myapp/Lab5/Question1.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ReadDemo(),
  ));
}

// void main() async {
//   runApp(ChangeNotifierProvider(
//     create: (context) => Check(),
//     child: const MaterialApp(
//       home: Q1(),
//       debugShowCheckedModeBanner: false, //ทำให้ Debug หายไปชั่วคราว,
//       // theme: ThemeData(scaffoldBackgroundColor: Colors.black45),
//     ),
//   ));
// }
