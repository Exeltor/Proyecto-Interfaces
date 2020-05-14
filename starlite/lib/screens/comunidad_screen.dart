import 'package:flutter/material.dart';

class ComunidadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceMedia = MediaQuery.of(context);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: (deviceMedia.size.height / 2) -
              Scaffold.of(context).appBarMaxHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  'El objetivo mas popular hoy',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  height: 200,
                  width: double.infinity,
                )
              ],
            ),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.5,
          maxChildSize: 1,
          builder: (context, _scrollController) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
          ),
        ),
      ],
    );
  }
}
