import 'package:flutter/material.dart';
import 'package:starlite/constants/styles.dart';
import 'package:starlite/widgets/rounded_black_button.dart';

class RecoveryScreen extends StatefulWidget {
  static const routeName = "/recoveryScreen";

  @override
  _RecoveryScreenState createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  bool loading = false;
  bool sent = false;

  _recoverPass() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      loading = false;
      sent = true;
    });

    await Future.delayed(Duration(seconds: 1));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Contraseña'),
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
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 20),
                          sent
                              ? Text(
                                  'Comprueba tu correo',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Container(
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
                                            color: Color.fromRGBO(
                                                240, 240, 240, 1),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black54,
                                                blurRadius: 10,
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                const Text(
                                                  'Recupera tu contraseña',
                                                  style:
                                                      TextStyle(fontSize: 22),
                                                ),
                                                TextField(
                                                  decoration:
                                                      kInputFieldStyle.copyWith(
                                                    labelText: 'Email',
                                                    prefixIcon:
                                                        Icon(Icons.mail),
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
                          if (!sent)
                            RoundedBlackButton(
                              onTap: _recoverPass,
                              child: const Text(
                                'Recuperar',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
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
