import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/catalog/catalog_screen.dart';
import 'package:catalog_app/presentation/design/loader_view.dart';

import 'start_presenter.dart';
import 'start_view.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> implements StartView {
  GlobalKey<FormState> _formKey;
  StartPresenter _startPresenter;
  bool _isLoading;
  TextEditingController _nameUserController;
  TextEditingController _passwordUserController;

  _StartScreenState() {
    _nameUserController = TextEditingController();
    _passwordUserController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _startPresenter = StartPresenter(this);
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    if(_isLoading) {
      return _getLoader();
    } else {
      return Form(
        key: _formKey,
        child: _getFormBody(),
      );
    }
  }

  Widget _getLoader(){
    return LoaderPage();
  }

  Widget _getFormBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
      ),
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
    return RaisedButton(
      onPressed: () {
        if(!_formKey.currentState.validate()) {
          return;
        }
        setState(() {
          _isLoading=true;
          _startPresenter.login(
              name: _nameUserController.text,
              password: _nameUserController.text
          );
        });
      },
      child:Text('Войти'),
      color: Colors.blue,
      textColor: Colors.white,
    );
  }

  @override
  void onLoginSuccess() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => CatalogScreen()
        )
    );
  }

  @override
  void onError(String error) {
    // TODO: implement onError
  }
}