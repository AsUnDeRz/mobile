import 'package:catalog_app_bloc/domain/bloc/form_login/login_form_bloc.dart';
import 'package:catalog_app_bloc/presentation/start/form/checkbox_widget.dart';
import 'package:catalog_app_bloc/presentation/start/form/name_widget.dart';
import 'package:catalog_app_bloc/presentation/start/form/password_widget.dart';
import 'package:catalog_app_bloc/presentation/start/form/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app_bloc/presentation/catalog/catalog_screen.dart';
import 'package:catalog_app_bloc/presentation/design/application_design.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_component.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final LoginFormBloc _loginFormBloc = UserModule.loginFormBloc();
  GlobalKey<FormState> _formKey;

  _StartScreenState() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocListener<LoginFormBloc, LoginFormState>(
        bloc: _loginFormBloc,
        listener: (context, state) {
          if (state is SuccessLoginState) {
            _onLoginSuccess();
          }
        },
        child: BlocBuilder<LoginFormBloc, LoginFormState>(
          bloc: _loginFormBloc,
          builder: (context, loginFormState) {
            return Form(
              key: _formKey,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ListView(
                    padding: EdgeInsets.all(constraints.maxWidth * 0.1),
                    children: <Widget>[
                      TitleWidget(),
                      Container(height:  30,),
                      NameWidget(_loginFormBloc.nameBloc),
                      Container(height:  30,),
                      PasswordWidget(_loginFormBloc.passwordBloc),
                      Container(height:  30,),
                      _getSubmitButton(),
                      Container(height:  30,),
                      CheckboxWidget(_loginFormBloc),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getSubmitButton() {
    return Button(
      label: 'Войти',
      handler: _onLogin,
    );
  }

  void _onLoginSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CatalogScreen()),
    );
  }

  void _onLogin() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _loginFormBloc.dispatch(LoginEvent());
  }
}
