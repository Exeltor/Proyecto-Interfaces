import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starlite/screens/login_screen.dart';
import 'package:starlite/screens/start_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
        canvasColor: Color.fromRGBO(158, 216, 213, 1),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          textTheme: Theme.of(context).textTheme,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
      ),
      home: StartScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
      },
    );
  }
}
