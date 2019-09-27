import 'package:catalog_app/presentation/menu_drawer/logout/logout_widget.dart';
import 'package:flutter/material.dart';

class MenuDrawerWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("Catalog"),
          ),
          ListTile(
            title: Text("Settings"),
            trailing: Icon(Icons.settings),
          ),
          ListTile(
            title: Text("Mode theme"),
            trailing: Icon(Icons.brightness_medium),
          ),
          LogoutWidget(),
        ],
      ),
    );
  }
}