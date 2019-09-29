import 'package:flutter/material.dart';

import 'package:catalog_app/domain/model/theme_mode_application.dart';
import 'package:catalog_app/presentation/menu_drawer/theme_mode_application_switcher/theme_mode_application_switcher_presenter.dart';
import 'package:catalog_app/presentation/menu_drawer/theme_mode_application_switcher/theme_mode_application_switcher_view.dart';

class ThemeModeApplicationSwitcherWidget extends StatefulWidget  {

  @override
  _ThemeModeApplicationSwitcherWidgetState createState() => _ThemeModeApplicationSwitcherWidgetState();
}

class _ThemeModeApplicationSwitcherWidgetState extends State<ThemeModeApplicationSwitcherWidget>  implements ThemeModeApplicationSwitcherView{

  ThemeModeApplication _themeModeApplication;
  ThemeModeApplicationSwitcherPresenter _themeModeApplicationSwitcherPresenter;

  _ThemeModeApplicationSwitcherWidgetState() {
    _themeModeApplicationSwitcherPresenter = ThemeModeApplicationSwitcherPresenter(this);
  }

  @override
  void initState() {
    _themeModeApplicationSwitcherPresenter.startThemeModeApplicationStream();
    super.initState();
  }

  @override
  void dispose() {
    _themeModeApplicationSwitcherPresenter.stopThemeModeApplicationStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var iconTheme;
    if(_themeModeApplication == null ){
      iconTheme = Icon(Icons.brightness_1);
    }
    else if( _themeModeApplication.mode == ThemeModeApplication.LIGHT_MODE ) {
      iconTheme = Icon(Icons.brightness_1);
    }
    else if ( _themeModeApplication.mode == ThemeModeApplication.DARK_MODE ) {
      iconTheme = Icon(Icons.brightness_3);
    }
    return ListTile(
      title: Text("Mode theme"),
      trailing: iconTheme,
      onTap: () => onChange(!_themeModeApplication.mode) ,
    );
  }

  @override
  void onChange(bool mode) {
    _themeModeApplicationSwitcherPresenter.changeThemeModeApplication(mode);
  }

  @override
  void onUpdate(ThemeModeApplication themeModeApplication) {
    setState(() {
      _themeModeApplication=themeModeApplication;
    });
  }
}