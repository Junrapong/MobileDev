import 'package:flutter/material.dart';

class Check with ChangeNotifier {
  // List<String> ans = [];
  var ans = [];

  // var scoll = [];
  void add(int score) {
    ans.add(score);
    notifyListeners();
  }

  // void check(String q) {
  //   for (int i = 0; i < ans.length; i++) {
  //     if (q == ans[i]) {
  //       scoll++;
  //     } else {
  //       scoll = 0;
  //     }
  //   }
  //   notifyListeners();
  // }

  void clear() {
    ans.clear();
    notifyListeners();
  }
}
