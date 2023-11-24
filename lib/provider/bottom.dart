import 'package:flutter/material.dart';

class Bottom extends ChangeNotifier {
  int _index = 0;
  int get currentPage => _index;

  void updatePage(int index) {
    _index = index;
    notifyListeners();
  }
}
