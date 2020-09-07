import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final VoidCallback _onPressed;
  String title;

  WidgetButton({Key key, VoidCallback onPressed, this.title})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.0),
      ),
      onPressed: _onPressed,
      color: Colors.white,
      child: Text(title,
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
