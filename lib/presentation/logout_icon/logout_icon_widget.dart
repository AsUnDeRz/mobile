import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/start/start_screen.dart';

import 'logout_icon_presenter.dart';
import 'logout_icon_view.dart';

class LogoutIconWidget extends StatefulWidget {
  @override
  _LogoutIconWidgetState createState() => _LogoutIconWidgetState();

}

class _LogoutIconWidgetState extends State<LogoutIconWidget> implements LogoutIconView {

  LogoutIconPresenter _logoutIconPresenter;

  _LogoutIconWidgetState() {
    _logoutIconPresenter =   LogoutIconPresenter(this);
  }

  @override
  Widget build(BuildContext context) =>
      IconButton(
      icon: Icon(Icons.exit_to_app),
      tooltip: 'logout',
      color: Colors.black,
      onPressed: onLogout,
    );

  @override
  void onLogout() => _logoutIconPresenter.logout();

  @override
  void onLogoutSuccess() =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StartScreen(),
        ),
      );
}