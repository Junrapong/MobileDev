import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Lab5/Check.dart';
import 'package:myapp/Lab5/Question1.dart';

import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => Check(),
    child: const MaterialApp(
      home: Q1(),
      debugShowCheckedModeBanner: false, //ทำให้ Debug หายไปชั่วคราว,
      // theme: ThemeData(scaffoldBackgroundColor: Colors.black45),
    ),
  ));
}
