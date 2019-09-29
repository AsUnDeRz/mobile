import 'package:catalog_app/domain/model/theme_mode_application.dart';
import 'package:catalog_app/internal/application_presenter.dart';
import 'package:catalog_app/internal/application_view.dart';
import 'package:catalog_app/presentation/design/application_design.dart';

import 'package:catalog_app/presentation/start/start_screen.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> implements ApplicationView {

  ApplicationPresenter _applicationPresenter;
  ThemeData _themeData;

  _ApplicationState(){
    _applicationPresenter = ApplicationPresenter(this);
  }

  @override
  void initState() {
    _applicationPresenter.startThemeModeApplicationStream();
    super.initState();
  }

  @override
  void dispose() {
    _applicationPresenter.stopThemeModeApplicationStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_themeData == null) {
      return LoaderPage();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalog app',
      theme: _themeData,
      home: StartScreen(),
    );

  }

  @override
  void onUpdate(ThemeModeApplication themeModeApplication) {
    setState(() {
      _themeData=themeModeApplication.theme;
    });
  }
}