import 'package:catalog_app/domain/bloc/menu_drawer/logout/logout_bloc.dart';
import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app/presentation/start/start_screen.dart';


class LogoutWidget extends StatefulWidget {
  @override
  _LogoutWidgetState createState() => _LogoutWidgetState();

}

class _LogoutWidgetState extends State<LogoutWidget> {
  final LogoutBloc _logoutBloc = UserModule.logoutBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _logoutBloc,
      child: BlocListener <LogoutBloc, LogoutState>(
        listener: (context, state) {
          if (state is LogoutApplyState) {
            _onLogoutSuccess();
          }
        },
        child: BlocBuilder<LogoutBloc, LogoutState>(
          builder: (context, state) {
            return  ListTile(
              title: Text("Loout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: _onLogout,
            );
          },
        ),
      ),
    );
  }

  void _onLogout() {
    _logoutBloc.dispatch(LogoutActionEvent());
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