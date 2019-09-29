
import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String label;
  final Function handler;

  Button({@required this.label, @required this.handler});

  @override
  Widget build(BuildContext context) {
    return  FlatButton(
      color:  Theme.of(context).buttonColor,
      child: Text(
        label,
      ),
      onPressed: handler,
    );
  }
}