import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app/domain/bloc/menu_drawer/application_theme_switcher/application_theme_bloc.dart';
import 'package:catalog_app/domain/model/application_theme.dart';
import 'package:catalog_app/internal/dependencies/application_theme_module.dart';

class ApplicationThemeSwitcherWidget extends StatefulWidget  {
  @override
  _ApplicationThemeSwitcherWidgetState createState() => _ApplicationThemeSwitcherWidgetState();
}

class _ApplicationThemeSwitcherWidgetState extends State<ApplicationThemeSwitcherWidget> {
  ApplicationThemeBloc _applicationThemeBloc = ApplicationThemeModule.applicationThemeBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _applicationThemeBloc,
      child: BlocBuilder<ApplicationThemeBloc, ApplicationThemeState>(
        builder: (context, state) {
          if (state is ApplicationThemeReadyState) {
            var iconTheme = Icon(Icons.brightness_1);
            if( state.applicationTheme.mode == ApplicationTheme.DARK_MODE ) {
              iconTheme = Icon(Icons.brightness_3);
            }
            return  ListTile(
              title: Text("Mode theme"),
              trailing: iconTheme,
              onTap: () => _onChange(state.applicationTheme.mode),
            );
          }
          return ListTile(
            title: Text("Mode theme"),
            trailing: Icon(Icons.brightness_1),
            onTap: () => _onChange(false),
          );
        },
      ),
    );
  }

  void _onChange(bool mode) {
    _applicationThemeBloc.dispatch(ApplicationThemeSwitchEvent());
  }
}