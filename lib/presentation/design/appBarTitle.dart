
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {

  final _title;

  AppBarTitle(this._title);

  @override
  Widget build(BuildContext context) =>
      Text(
        _title,
      );


}