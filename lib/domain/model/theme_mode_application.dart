import 'package:flutter/material.dart';

class ThemeModeApplication {
  static const LIGHT_MODE = false;
  static const DARK_MODE = true;

  final bool mode;

  ThemeModeApplication(this.mode);
  ThemeModeApplication.light(): mode = LIGHT_MODE;
  ThemeModeApplication.dark(): mode = DARK_MODE;

  ThemeData get theme {
    if(mode) return ThemeData.dark();

    return ThemeData.light();
  }
}