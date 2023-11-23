import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  // int get count(){return _count;}
  int get count => _count; //getter선언  Counter.count로 접근가능
  void add() {
    _count++;
    notifyListeners();
  }

  void minus() {
    _count--;
    notifyListeners();
  }
}
