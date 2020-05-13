import 'package:flutter/material.dart';
import 'package:starlite/screens/comunidad_screen.dart';
import 'package:starlite/screens/gastos_screen.dart';
import 'package:starlite/screens/home_screen.dart';
import 'package:starlite/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  static final routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  Animation<Color> animationAppBar, animationIconsText;
  AnimationController controller;
  ScrollController _scrollController;
  bool _scrolledDown = false;
  int _selectedScreen = 0;
  List _pageViews = [
    {
      'screen': HomeScreen(),
      'title': 'Home',
      'actions': [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      'scrolling': false,
    },
    {
      'screen': GastosScreen(),
      'title': 'Mis Gastos',
      'scrolling': false,
    },
    {
      'screen': ComunidadScreen(),
      'title': 'Comunidad',
      'scrolling': true,
    },
  ];

  _selectPage(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.minScrollExtent) {
      controller.reverse();
      setState(() {
        _scrolledDown = false;
      });
    } else {
      controller.forward();
      setState(() {
        _scrolledDown = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animationAppBar = ColorTween(begin: Colors.transparent, end: Colors.black)
        .animate(controller);
    animationIconsText =
        ColorTween(begin: Colors.black, end: Colors.white).animate(controller);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: _pageViews[_selectedScreen]['screen'],
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            _pageViews[_selectedScreen]['title'],
            style: TextStyle(color: animationIconsText.value),
          ),
          backgroundColor: animationAppBar.value,
          actions: _pageViews[_selectedScreen]['actions'],
          iconTheme: IconThemeData(color: animationIconsText.value),
        ),
        drawer: AppDrawer(),
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreen,
          onTap: _selectPage,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          elevation: 0,
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
      ),
    );
  }
}

// AnimatedDefaultTextStyle(
//           child: Text(
//             _pageViews[_selectedScreen]['title'],
//             style: TextStyle(
//               fontFamily: textStyle.fontFamily,
//               fontSize: 22,
//               fontWeight: textStyle.fontWeight,
//             ),
//           ),
//           style: _isScrolledDown
//               ? TextStyle(color: Colors.white)
//               : TextStyle(color: Colors.black),
//           duration: Duration(milliseconds: 300),
//         ),
