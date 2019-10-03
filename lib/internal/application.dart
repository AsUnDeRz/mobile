import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app/presentation/start/start_screen.dart';
import 'package:catalog_app/domain/bloc/menu_drawer/application_theme_switcher/application_theme_bloc.dart';
import 'package:catalog_app/internal/dependencies/application_theme_module.dart';
import 'package:catalog_app/presentation/design/application_design.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  ApplicationThemeBloc _applicationThemeBloc = ApplicationThemeModule.applicationThemeBloc;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      builder: (context) => _applicationThemeBloc,
      child: BlocBuilder<ApplicationThemeBloc, ApplicationThemeState>(
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
      ),
    );
  }
}