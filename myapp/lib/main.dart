import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/provider/cart.dart';
import 'package:myapp/provider/count.dart';
import 'package:myapp/provider/counter.dart';
import 'package:myapp/provider/shop.dart';
import 'package:provider/provider.dart';

import 'input.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: const MaterialApp(
        home: Shop(),
        debugShowCheckedModeBanner: false //ทำให้ Debug หายไปชั่วคราว,
        ),
  ));
}
