import 'package:flutter/material.dart';
import 'package:starlite/screens/ajustes_screen.dart';
import 'package:provider/provider.dart';
import 'package:starlite/providers/data.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Starlite'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Opciones'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AjustesScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: const Text('Cerrar sesion'),
            onTap: () {
              Navigator.of(context).pop();
              Provider.of<DataProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
