import 'package:flutter/material.dart';
import 'package:starlite/screens/comunidad_screen.dart';
import 'package:starlite/screens/gastos_screen.dart';
import 'package:starlite/screens/home_screen.dart';

class TabsScreen extends StatefulWidget {
  static final routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreen = 0;
  List _pageViews = [
    {
      'screen': HomeScreen(),
      'title': 'Home'
    },
    {
      'screen': GastosScreen(),
      'title': 'Mis Gastos'
    },
    {
      'screen': ComunidadScreen(),
      'title': 'Comunidad'
    },
  ];

  _selectPage(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageViews[_selectedScreen]['title']),
      ),
      body: _pageViews[_selectedScreen]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreen,
        onTap: _selectPage,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Mis Gastos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Comunidad'),
          ),
        ],
      ),
    );
  }
}
