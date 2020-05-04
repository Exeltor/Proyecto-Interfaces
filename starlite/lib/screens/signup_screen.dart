import 'package:flutter/material.dart';
import 'package:starlite/constants/styles.dart';
import 'package:starlite/widgets/rounded_black_button.dart';

class SignupScreen extends StatefulWidget {
  static final routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _scrollController = ScrollController();
  bool loading = false;
  bool registered = false;
  final _form = GlobalKey<FormState>();
  String _pass1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _register() async {
    if (!_form.currentState.validate()) return;

    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      loading = false;
      registered = true;
    });

    await Future.delayed(Duration(seconds: 1));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/StarLiteLogo.png'),
          ),
          Container(
            child: DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 1,
              builder: (context, _scrollController) => Container(
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
                child: loading || registered
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (loading) CircularProgressIndicator(),
                          if (registered)
                            Text(
                              'Se ha registrado correctamente',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      )
                    : Form(
                        key: _form,
                        child: ListView(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          controller: _scrollController,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  '¡Comienza a apuntar tus deseos!',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                            TextFormField(
                              decoration: kInputFieldStyle.copyWith(
                                labelText: 'Nombre de Usuario',
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Este campo es obligatorio';
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: kInputFieldStyle.copyWith(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.mail),
                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Este campo es obligatorio';
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: kInputFieldStyle.copyWith(
                                labelText: 'Contraseña',
                                prefixIcon: Icon(Icons.vpn_key),
                              ),
                              obscureText: true,
                              onChanged: (value) => _pass1 = value,
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Este campo es obligatorio';
                                if(value.length < 6) return 'Introduce al menos 6 carácteres';
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: kInputFieldStyle.copyWith(
                                labelText: 'Repite Contraseña',
                                prefixIcon: Icon(Icons.vpn_key),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Este campo es obligatorio';
                                if (value != _pass1) return 'Las contraseñas no coinciden';
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            RoundedBlackButton(
                              child: const Text(
                                'Registro',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onTap: _register,
                            )
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
