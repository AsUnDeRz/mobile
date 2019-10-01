import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app/presentation/catalog/catalog_screen.dart';
import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/domain/bloc/login_bloc.dart';
import 'package:catalog_app/internal/dependencies/application_component.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  final LoginBloc _loginBloc = UserModule.loginBloc();
  GlobalKey<FormState> _formKey;
  TextEditingController _nameUserController;
  TextEditingController _passwordUserController;

  _StartScreenState() {
    _nameUserController = TextEditingController();
    _passwordUserController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider <LoginBloc>(
        builder: (context) => _loginBloc,
        child: BlocListener <LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginApplyState) {
              _onLoginSuccess();
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return  _getBody();
            },
          ),
        ),
      ),
    );
  }

  Widget _getBody() {
    return Form(
      key: _formKey,
      child: _getFormBody(),
    );
  }


  Widget _getFormBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          padding: EdgeInsets.all( constraints.maxWidth * 0.1),
          children: <Widget>[
            Text(
              'Catalog app',
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
            Container(height: 30.0),
            _getTextFormField(
              label: 'Логин',
              errorText: 'Пожалуйста, введите логин',
              controller: _nameUserController,
            ),
            Container(height: 20.0),
            _getTextFormField(
              label: 'Пароль',
              errorText: 'Пожалуйста, введите пароль',
              obscure: true,
              controller: _passwordUserController,
            ),
            Container(height: 20.0),
            _getSubmitButton()
          ],
        );
      },
    );
  }

  Widget _getTextFormField({
    String label,
    String errorText,
    bool obscure = false,
    @required TextEditingController controller}) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: label,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return errorText;
        }return null;
      },
    );
  }

  Widget _getSubmitButton(){
    return Button(
      label: 'Войти',
      handler: _onLogin,
    );
  }

  void _onLoginSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => CatalogScreen()
      ),
    );
  }

  void _onLogin() {
    if(!_formKey.currentState.validate()) {
      return;
    }
    _loginBloc.dispatch(LoginActionEvent(
        _nameUserController.text,
        _passwordUserController.text)
    );
  }
}