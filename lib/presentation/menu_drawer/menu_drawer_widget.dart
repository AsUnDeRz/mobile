import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/menu_drawer/logout/logout_widget.dart';
import 'package:catalog_app/presentation/menu_drawer/application_mode_switcher/application_mode_switcher_widget.dart';
import 'package:catalog_app/presentation/menu_drawer/avatar/avatar_widget.dart';

class MenuDrawerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          AvatarWidget(),
          Divider(height: 1.0,),
          ApplicationThemeSwitcherWidget(),
          Divider(height: 1.0,),
          LogoutWidget(),
          Divider(height: 1.0,),
        ],
      ),
    );
  }
}