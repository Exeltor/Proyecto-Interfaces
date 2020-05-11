import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  bool isLoggedIn = false;

  login() {
    this.isLoggedIn = true;
    notifyListeners();
  }

  logout() {
    this.isLoggedIn = false;
    this.notifyListeners();
  }
}