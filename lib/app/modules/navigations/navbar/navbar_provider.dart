import 'package:flutter/material.dart';

class NavbarProvider extends ChangeNotifier{
  int currentIndex = 0;

  void changeScreen(int index) {
    currentIndex = index;
    notifyListeners();
  }
}