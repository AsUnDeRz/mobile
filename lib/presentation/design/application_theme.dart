import 'dart:io';

import 'package:flutter/material.dart';

class ApplicationTheme {
  static ThemeData theme() {
    return ThemeData(
      brightness: (Platform.isIOS) ? Brightness.dark : Brightness.dark,
//      primaryColorBrightness: Brightness.dark,
      primaryColor: Colors.black,
      accentColor: Colors.white,
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Helvetica',
      textTheme: TextTheme(
        button: TextStyle(
          height: 1.3,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
//        canvasColor: Colors.transparent,
//      primarySwatch: Colors.teal,
    );
  }
}
