import 'package:flutter/material.dart';
import 'package:starlite/screens/ajustes_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Starlite'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Opciones'),
            onTap: () =>
                Navigator.of(context).pushNamed(AjustesScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: const Text('Cerrar sesion'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
