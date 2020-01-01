import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:social_network/presentation/design/application_design.dart';
import 'package:social_network/presentation/main/main_screen.dart';




class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ApplicationTheme.theme(),
        title: '1440',
        home: MainScreen());
  }
}
