import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app_bloc/domain/bloc/menu_drawer/application_theme_switcher/switcher_application_theme_bloc.dart';
import 'package:catalog_app_bloc/domain/model/application_theme.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_theme_module.dart';

class ApplicationThemeSwitcherWidget extends StatefulWidget  {
  @override
  _ApplicationThemeSwitcherWidgetState createState() => _ApplicationThemeSwitcherWidgetState();
}

class _ApplicationThemeSwitcherWidgetState extends State<ApplicationThemeSwitcherWidget> {
  SwitcherApplicationThemeBloc _applicationThemeBloc = ApplicationThemeModule.switcherApplicationThemeBloc();

  @override
  void dispose() {
    _applicationThemeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitcherApplicationThemeBloc, SwitcherApplicationThemeState>(
      bloc: _applicationThemeBloc,
      builder: (context, state) {
        if (state is ReadySwitcherApplicationThemeState) {
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
    );
  }

  void _onChange(bool mode) {
    _applicationThemeBloc.add(SwitchSwitcherApplicationThemeEvent());
  }
}