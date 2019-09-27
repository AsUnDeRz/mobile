import 'package:catalog_app/presentation/menu_drawer/logout/logout_presenter.dart';
import 'package:catalog_app/presentation/menu_drawer/logout/logout_view.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/start/start_screen.dart';


class LogoutWidget extends StatefulWidget {
  @override
  _LogoutWidgetState createState() => _LogoutWidgetState();

}

class _LogoutWidgetState extends State<LogoutWidget> implements LogoutView {

  LogoutPresenter _logoutPresenter;

  _LogoutWidgetState() {
    _logoutPresenter =   LogoutPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Loout"),
      trailing: Icon(Icons.exit_to_app),
      onTap: onLogout,
    );
  }

  @override
  void onLogout() => _logoutPresenter.logout();

  @override
  void onLogoutSuccess() =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StartScreen(),
        ),
      );
}