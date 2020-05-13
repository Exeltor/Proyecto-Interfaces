import 'package:flutter/material.dart';
import 'package:starlite/widgets/chart.dart';

class GastosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceMedia = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: (deviceMedia.size.height / 2) -
              Scaffold.of(context).appBarMaxHeight,
          child: Center(
            child: Chart(),
          ),
        ),
        Container(
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
      ],
    );
  }
}
