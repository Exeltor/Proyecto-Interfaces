import 'package:flutter/material.dart';

class CardListItem extends StatelessWidget {
  const CardListItem({this.leading, this.title, this.subtitle, this.trailing});

  final Widget leading, title, subtitle, trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          const BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            leading,
            const SizedBox(width: 20),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  title,
                  const SizedBox(height: 10),
                  subtitle,
                ],
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
