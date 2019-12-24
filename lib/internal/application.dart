import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app_bloc/presentation/start/start_screen.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_theme_module.dart';
import 'package:catalog_app_bloc/presentation/design/application_design.dart';
import 'package:catalog_app_bloc/domain/bloc/menu_drawer/application_theme_switcher/refresher_application_theme_bloc.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  RefresherApplicationThemeBloc _applicationThemeBloc = ApplicationThemeModule.refresherApplicationThemeBloc();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  void dispose() {
    _applicationThemeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RefresherApplicationThemeBloc, RefresherApplicationThemeState>(
      bloc: _applicationThemeBloc,
      builder: (context, state) {
        if (state is ReadyState) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Catalog app',
            theme: state.applicationTheme.theme,
            home: StartScreen(),
          );
        }
        return Container(
          color: Colors.white,
          child: LoaderPage(),
        );
      },
    );
  }
}