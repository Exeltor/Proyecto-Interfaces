import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  bool isLoggedIn = false;
  List<Map<String, dynamic>> users = [
    {'email': 'jorge@mail.com', 'password': 'jorgeM', 'metas': []},
    {'email': 'alexey@mail.com', 'password': 'alexey', 'metas': []},
  ];
  List<Map<String, dynamic>> products = [
    {
      'titulo': 'Articulo 1',
      'imagen': 'https://via.placeholder.com/150',
      'descripcion': 'Un teclado tu wapo wapo',
    },
    {
      'titulo': 'Otro artuculete',
      'imagen': 'https://via.placeholder.com/150',
      'descripcion': 'No entiendo que es esto',
    },
    {
      'titulo': 'Ayudame',
      'imagen': 'https://via.placeholder.com/150',
      'descripcion': 'Por favor',
    },
    {
      'titulo': 'Tengo muchos',
      'imagen': 'https://via.placeholder.com/150',
      'descripcion': 'Que tienes muchos?',
    },
    {
      'titulo': 'Quehaceres',
      'imagen': 'https://via.placeholder.com/150',
      'descripcion': 'Vuaaaamos',
    },
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
    notifyListeners();
  }
}
