import 'package:flutter/material.dart';
import 'package:starlite/widgets/rounded_black_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceMedia = MediaQuery.of(context);
    return Stack(
      children: <Widget>[
        Container(
          height: (deviceMedia.size.height / 2) -
              Scaffold.of(context).appBarMaxHeight,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'No tienes ninguna meta aun',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              RoundedBlackButton(
                child: Text(
                  'Busca articulos',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onTap: () {},
              ),
            ],
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
