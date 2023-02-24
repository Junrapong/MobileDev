import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/provider/count.dart';
import 'package:myapp/provider/counter.dart';
import 'package:provider/provider.dart';

import 'input.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Count(),
    child: const MaterialApp(
        home: Counter(),
        debugShowCheckedModeBanner: false //ทำให้ Debug หายไปชั่วคราว,
        ),
  ));
}
