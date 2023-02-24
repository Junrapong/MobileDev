import 'package:flutter/material.dart';

class Count with ChangeNotifier {
  int value = 0;

  void add() {
    value++;
    notifyListeners(); //บอกตัวอื่นว่าเปลี่ยนแปลงค่า
  }

  void drop() {
    value--;
    notifyListeners();
  }
}
