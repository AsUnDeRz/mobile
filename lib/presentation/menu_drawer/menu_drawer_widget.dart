import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/menu_drawer/logout/logout_widget.dart';
import 'package:catalog_app/presentation/menu_drawer/theme_mode_application_switcher/theme_mode_application_switcher_widget.dart';
import 'package:catalog_app/presentation/menu_drawer/avatar/avatar_widget.dart';
import 'package:catalog_app/presentation/menu_drawer/route_catalog/logout_widget.dart';

class MenuDrawerWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          AvatarWidget(),
          RouteCatalogWidget(),
          ThemeModeApplicationSwitcherWidget(),
          LogoutWidget(),
        ],
      ),
    );
  }
}