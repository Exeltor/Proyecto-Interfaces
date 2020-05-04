import 'package:flutter/material.dart';
import 'package:starlite/constants/styles.dart';
import 'package:starlite/widgets/rounded_black_button.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "loginScreen";

  @override
  Widget build(BuildContext context) {
    final dimensions = MediaQuery.of(context).size;
    return Scaffold(
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
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    TextField(
                                      decoration: kInputFieldStyle.copyWith(
                                        labelText: 'Email',
                                        prefixIcon: Icon(Icons.mail),
                                      ),
                                    ),
                                    TextField(
                                      decoration: kInputFieldStyle.copyWith(
                                        labelText: 'Contraseña',
                                        prefixIcon: Icon(Icons.vpn_key),
                                      ),
                                    ),
                                  ],
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
