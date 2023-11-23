import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  void add() {
    _count++;
    notifyListeners();
  }

  void minus() {
    _count--;
    notifyListeners();
  }
}
