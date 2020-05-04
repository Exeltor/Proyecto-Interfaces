import 'package:flutter/material.dart';
import 'package:starlite/screens/login_screen.dart';
import 'package:starlite/screens/recovery_screen.dart';
import 'package:starlite/screens/signup_screen.dart';
import 'package:starlite/widgets/rounded_black_button.dart';

class StartScreen extends StatelessWidget {
  static const routeName = "startScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/StarLiteLogo.png'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              RoundedBlackButton(
                onTap: () => Navigator.of(context).pushNamed(LoginScreen.routeName),
                child: const Text(
                  'Iniciar sesión',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              RoundedBlackButton(
                onTap: () => Navigator.of(context).pushNamed(SignupScreen.routeName),
                child: const Text(
                  'Registro',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pushNamed(RecoveryScreen.routeName),
                child: Text('Recuperar contraseña'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
