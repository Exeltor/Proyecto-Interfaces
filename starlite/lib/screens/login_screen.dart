import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlite/constants/styles.dart';
import 'package:starlite/providers/data.dart';
import 'package:starlite/widgets/rounded_black_button.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "loginScreen";
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final Map<String, String> data = {
    'email': null,
    'password': null,
  };

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  _validateAndSubmit(BuildContext context) {
    if (!this._form.currentState.validate()) return;

    this._form.currentState.save();

    final index = Provider.of<DataProvider>(context, listen: false)
        .users
        .indexWhere((user) =>
            user['email'] == data['email'] &&
            user['password'] == data['password']);

    if (index < 0) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Email o contraseña incorrectos'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    Navigator.of(context).pop();
    Provider.of<DataProvider>(context, listen: false).login(index);
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: dimensions.height / 2,
              child: Image.asset(
                'assets/StarLiteLogo.png',
              ),
            ),
            Container(
              width: double.infinity,
              height: dimensions.height / 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(235, 235, 235, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      height: 220,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(240, 240, 240, 1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Form(
                                  key: _form,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      TextFormField(
                                        decoration: kInputFieldStyle.copyWith(
                                          labelText: 'Email',
                                          prefixIcon: Icon(Icons.mail),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onSaved: (value) =>
                                            data['email'] = value,
                                        validator: (value) {
                                          if (value.isEmpty)
                                            return 'Rellena este campo';
                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        decoration: kInputFieldStyle.copyWith(
                                          labelText: 'Contraseña',
                                          prefixIcon: Icon(Icons.vpn_key),
                                        ),
                                        onSaved: (value) =>
                                            data['password'] = value,
                                        obscureText: true,
                                        validator: (value) {
                                          if (value.isEmpty)
                                            return 'Rellena este campo';
                                          if (value.length < 6)
                                            return 'Al menos 6 caracteres';
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    RoundedBlackButton(
                      child: const Text(
                        'Iniciar Sesión',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onTap: () => _validateAndSubmit(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
