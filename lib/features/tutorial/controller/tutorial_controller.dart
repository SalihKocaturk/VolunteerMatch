import 'package:flutter/material.dart';

class TutorialController extends ChangeNotifier {
  final int total;
  int _index = 0;

  TutorialController(this.total);
  int get index => _index;

  bool get isFirst => _index == 0;
  bool get isLast => _index == total - 1;

  void next() {
    if (!isLast) {
      _index++;
      notifyListeners();
    }
  }

  void back() {
    if (!isFirst) {
      _index--;
      notifyListeners();
    }
  }
}
