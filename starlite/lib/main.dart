import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:starlite/providers/data.dart';
import 'package:starlite/screens/ajustes_screen.dart';
import 'package:starlite/screens/login_screen.dart';
import 'package:starlite/screens/recovery_screen.dart';
import 'package:starlite/screens/search_screen.dart';
import 'package:starlite/screens/signup_screen.dart';
import 'package:starlite/screens/start_screen.dart';
import 'package:starlite/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        title: 'StarLite',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
          canvasColor: Color.fromRGBO(158, 216, 213, 1),
          appBarTheme: AppBarTheme(
            color: Colors.black,
            elevation: 0,
          ),
          sliderTheme: SliderThemeData(
            activeTrackColor: Colors.deepPurple,
            inactiveTrackColor: Colors.purpleAccent,
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 1.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: Colors.deepPurple,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.deepPurple,
            inactiveTickMarkColor: Colors.deepPurple,
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.deepPurple,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: Selector<DataProvider, bool>(
          selector: (context, dataProvider) => dataProvider.isLoggedIn,
          builder: (context, loggedIn, child) =>
              loggedIn ? TabsScreen() : StartScreen(),
        ),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          SignupScreen.routeName: (context) => SignupScreen(),
          RecoveryScreen.routeName: (context) => RecoveryScreen(),
          TabsScreen.routeName: (context) => TabsScreen(),
          AjustesScreen.routeName: (context) => AjustesScreen(),
          SearchScreen.routeName: (context) => SearchScreen(),
        },
      ),
    );
  }
}
