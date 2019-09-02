import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/catalog/catalog_screen.dart';

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

  _StartScreenState() {
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
    return Form(
        key: _formKey,
        child: _getFormBody(),
    );
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
          ),
          Container(height: 20.0),
          _getTextFormField(
            label: 'Пароль',
            errorText: 'Пожалуйста, введите пароль',
            obscure: true,
          ),
          Container(height: 20.0),
          _getSubmitButton()
        ],
      ),
    );
  }
  Widget _getTextFormField({String label, String errorText, bool obscure = false}) {
    return TextFormField(
      obscureText: obscure,
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

  Widget _getSubmitButton(){
    return RaisedButton(
      onPressed: (){
        if(_formKey.currentState.validate()) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CatalogScreen()));
        }
      },
      child:Text('Войти'),
      color: Colors.blue,
      textColor: Colors.white,
    );
  }

  @override
  void onError(String error) {
    // TODO: implement onError
  }
}