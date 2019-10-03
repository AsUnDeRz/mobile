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
      body: BlocProvider<LoginBloc>(
        builder: (context) => _loginBloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is ApplyState) {
              _onLoginSuccess();
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              bool agree = false;
              Widget agreeText = Text('На всё согласен(на)');
              if(state is UpdateAgreeState){
                agree = state.agree;
              }
              if (state is FailureAgreeState) {
                agreeText = Text('На всё согласен(на)', style: TextStyle(color: Colors.redAccent),);
              }
              return _getBody(agree, agreeText);
            },
          ),
        ),
      ),
    );
  }

  Widget _getBody(agree, agreeText) {
    return Form(
      key: _formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            padding: EdgeInsets.all(constraints.maxWidth * 0.1),
            children: <Widget>[
              Text(
                'Catalog app',
                style: TextStyle(fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
              Container(height: 30.0),
              _getTextFormField(
                label: 'Имя',
                errorText: 'Пожалуйста, введите имя',
                controller: _nameUserController,
                onChange: _onUpdateBlocName,
              ),
              Container(height: 20.0),
              _getTextFormField(
                label: 'Пароль',
                errorText: 'Пожалуйста, введите пароль',
                obscure: true,
                controller: _passwordUserController,
                onChange: _onUpdateBlocPassword,
              ),
              Container(height: 20.0),
              _getSubmitButton(),
              Container(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Spacer(flex: 1,),
                    Checkbox(
                      value: agree,
                      onChanged: _onUpdateBlocAgree,
                    ),
                    Container(width:  20,),
                    agreeText,
                    Spacer(flex: 1,),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getTextFormField(
      {String label,
      String errorText,
      bool obscure = false,
      @required TextEditingController controller,
      Function onChange}) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: label,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return errorText;
        }
        return null;
      },
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

  void _onUpdateBlocName(String name) {
    _loginBloc.dispatch(UpdateNameEvent(name));
  }

  void _onUpdateBlocPassword(String password) {
    _loginBloc.dispatch(UpdatePasswordEvent(password));
  }

  void _onUpdateBlocAgree(agree) {
    _loginBloc.dispatch(UpdateAgreeEvent(agree));
  }

  void _onLogin() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _loginBloc.dispatch(ActionEvent());
  }
}
