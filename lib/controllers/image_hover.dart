import 'package:flutter/material.dart';

class ImageHover extends ChangeNotifier {
  int _index = 0;
  bool _isHover = false;
  int get index => _index;
  bool get isHover => _isHover;
  int _currentTab = 0;
  int get currentTab => _currentTab;
  hover({required int index, required bool isHover}) {
    _index = index;
    _isHover = isHover;
    notifyListeners();
  }

  setCurrentTab({required int index}) {
    _currentTab = index;
    notifyListeners();
  }
}
