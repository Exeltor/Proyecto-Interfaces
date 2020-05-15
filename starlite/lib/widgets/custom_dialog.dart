import 'package:flutter/material.dart';

const double padding = 16.0;
const double avatarRadius = 66.0;

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  final bool error;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.error = false,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: avatarRadius + padding,
            bottom: padding,
            left: padding,
            right: padding,
          ),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: padding,
          right: padding,
          child: CircleAvatar(
            backgroundColor: error ? Colors.red : Colors.green,
            radius: avatarRadius,
            child: error
                ? Icon(
                    Icons.close,
                    size: 60,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.check,
                    size: 60,
                    color: Colors.white,
                  ),
          ),
        ),
      ],
    );
  }
}
