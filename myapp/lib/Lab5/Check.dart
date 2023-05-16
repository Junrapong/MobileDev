import 'package:flutter/cupertino.dart';

class Check with ChangeNotifier {
  var ans = [];

  void add(int score) {
    ans.add(score);
    notifyListeners();
  }

  void clear() {
    ans.clear();
    notifyListeners();
  }
}
