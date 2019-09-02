import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/start/start_screen.dart';


class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalog app',
//      theme: ThemeData(),
      home: StartScreen(),
    );
  }
}