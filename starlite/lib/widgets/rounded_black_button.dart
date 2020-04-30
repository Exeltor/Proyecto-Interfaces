import 'package:flutter/material.dart';

class RoundedBlackButton extends StatelessWidget {
  final Widget child;
  final Function onTap;

  RoundedBlackButton({this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 70,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        color: Colors.black,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Center(child: child),
        ),
      ),
    );
  }
}
