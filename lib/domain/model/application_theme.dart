import 'package:flutter/material.dart';

class ApplicationTheme {
  static const LIGHT_MODE = false;
  static const DARK_MODE = true;

  final bool mode;

  ApplicationTheme(this.mode);
  ApplicationTheme.light(): mode = LIGHT_MODE;
  ApplicationTheme.dark(): mode = DARK_MODE;

  ThemeData get theme {
    if(mode) return ThemeData.dark();

    return ThemeData.light();
  }
}