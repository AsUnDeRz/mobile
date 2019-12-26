import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app_bloc/presentation/start/start_screen.dart';
import 'package:catalog_app_bloc/domain/bloc/menu_drawer/logout/logout_bloc.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_component.dart';

class LogoutWidget extends StatefulWidget {
  @override
  _LogoutWidgetState createState() => _LogoutWidgetState();

}

class _LogoutWidgetState extends State<LogoutWidget> {
  final LogoutBloc _logoutBloc = UserModule.logoutBloc();

  @override
  void dispose() {
    _logoutBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener <LogoutBloc, LogoutState>(
      bloc: _logoutBloc,
      listener: (context, state) {
        if (state is ApplyLogoutState) {
          _onLogoutSuccess();
        }
      },
      child: BlocBuilder<LogoutBloc, LogoutState>(
        bloc: _logoutBloc,
        builder: (context, state) {
          return  ListTile(
            title: Text("Loout"),
            trailing: Icon(Icons.exit_to_app),
            onTap: _onLogout,
          );
        },
      ),
    );
  }

  void _onLogout() {
    _logoutBloc.add(ActionLogoutEvent());
  }

  void _onLogoutSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StartScreen(),
      ),
    );
  }
}