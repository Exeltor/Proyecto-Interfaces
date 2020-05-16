import 'package:flutter/material.dart';
import 'package:starlite/screens/tabs_screen.dart';
import 'package:starlite/widgets/rounded_black_button.dart';

class AjustesScreen extends StatefulWidget {
  static final routeName = '/ajustes';

  @override
  _AjustesScreenState createState() => _AjustesScreenState();
}

class _AjustesScreenState extends State<AjustesScreen> {
  bool promo = false;
  String dropdownValue = '10 Dias';
  double _value = 1, _value1 = 5, _value2 = 5;

  onSwitchPromValueChanged(bool newProm) {
    setState(() {
      promo = newProm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      appBar: AppBar(title: Text("Ajustes de Perfil")),
      body: Column(
        children: <Widget>[
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Notificaciones",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            )
          ]),
          SwitchListTile.adaptive(
              activeColor: Colors.deepPurple,
              title: Text(
                "Recibir promociones especiales",
                style: TextStyle(fontSize: 15),
              ),
              value: promo,
              onChanged: onSwitchPromValueChanged,
              secondary: const Icon(Icons.assessment)),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text("Tiempo entre nuevos precios ",
                style: TextStyle(fontSize: 15)),
            trailing: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Color.fromRGBO(235, 235, 235, 1),
                ),
                child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['10 Dias', '5 Dias', '2 Dias', '24 Horas']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList())),
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Plazos en días de los Objetivos",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            )
          ]),
          ListTile(
            leading: Icon(Icons.star_border),
            title: Text("Inmediato", style: TextStyle(fontSize: 15)),
            trailing: Container(
              width: 200,
              child: Slider(
                value: _value,
                min: 1,
                max: 5,
                divisions: 4,
                label: '$_value',
                onChanged: (value) {
                  setState(
                    () {
                      _value = value;
                    },
                  );
                },
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.star_half),
            title: Text("Medio Plazo", style: TextStyle(fontSize: 15)),
            trailing: Container(
              width: 200,
              child: Slider(
                value: _value1,
                min: 5,
                max: 50,
                divisions: 10,
                label: '$_value1',
                onChanged: (value) {
                  setState(
                    () {
                      _value1 = value;
                    },
                  );
                },
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Largo Plazo", style: TextStyle(fontSize: 15)),
            trailing: Container(
              width: 200,
              child: Slider(
                value: _value2,
                min: 5,
                max: 50,
                divisions: 10,
                label: '$_value2',
                onChanged: (value) {
                  setState(
                    () {
                      _value2 = value;
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(TabsScreen.routeName),
                child: Text(
                  '¿Necesitas ayuda?',
                  style: const TextStyle(color: Colors.black),
                )),
          ),
          RoundedBlackButton(
              child: const Text(
                'Aceptar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(TabsScreen.routeName))
        ],
      ),
    );
  }
}
