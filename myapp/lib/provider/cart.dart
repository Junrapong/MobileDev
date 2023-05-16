import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  // List<String> cart = [];
  var cart = [];

  void add(String fruitName) {
    cart.add(fruitName);
    notifyListeners();
  }

  void clear() {
    cart.clear();
    notifyListeners();
  }
}
