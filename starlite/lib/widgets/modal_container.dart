import 'package:flutter/material.dart';

class ModalContainer extends StatelessWidget {
  const ModalContainer({@required this.height, @required this.child, this.color = const Color(0xFF737373)});

  final double height;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
          ),
        ),
        child: child,
      ),
    );
  }
}