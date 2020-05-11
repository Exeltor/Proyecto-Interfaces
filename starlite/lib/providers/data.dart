import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  bool isLoggedIn = false;
  List<Map<String, dynamic>> users = [
    {'email': 'jorge@mail.com', 'password': 'jorgeM', 'metas': []},
    {'email': 'alexey@mail.com', 'password': 'alexey', 'metas': []},
  ];
  List<Map<String, dynamic>> products = [
    {}
  ];

  int currentUser;

  login(int index) {
    this.isLoggedIn = true;
    currentUser = index;
    notifyListeners();
  }

  logout() {
    this.isLoggedIn = false;
    currentUser = null;
    this.notifyListeners();
  }
}
