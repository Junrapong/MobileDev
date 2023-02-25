import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Lab5/Check.dart';
import 'package:myapp/Lab5/Question1.dart';
import 'package:myapp/provider/cart.dart';
import 'package:myapp/provider/count.dart';
import 'package:myapp/provider/counter.dart';
import 'package:myapp/provider/shop.dart';
import 'package:provider/provider.dart';

import 'input.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => Check(),
    child: const MaterialApp(
      home: Question1(),
      debugShowCheckedModeBanner: false, //ทำให้ Debug หายไปชั่วคราว,
      // theme: ThemeData(scaffoldBackgroundColor: Colors.black45),
    ),
  ));
}
