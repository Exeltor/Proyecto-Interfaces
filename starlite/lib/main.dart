import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlite/screens/login_screen.dart';
import 'package:starlite/screens/recovery_screen.dart';
import 'package:starlite/screens/signup_screen.dart';
import 'package:starlite/screens/start_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarLite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
        canvasColor: Color.fromRGBO(158, 216, 213, 1),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0,
        ),
      ),
      home: StartScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        RecoveryScreen.routeName: (context) => RecoveryScreen()
      },
    );
  }
}
