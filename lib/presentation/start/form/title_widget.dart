import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text(
      'Catalog app',
      style: TextStyle(fontSize: 25.0),
      textAlign: TextAlign.center,
    );
  }

}