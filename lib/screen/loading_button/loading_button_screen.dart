import 'package:flutter/material.dart';

import 'navigation.dart';


class LoadingButtonScreen extends StatelessWidget {
  LoadingButtonScreen() {
    Navigation.initPaths();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Navigation.router.generator,
    );
  }
}
