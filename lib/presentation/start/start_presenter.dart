import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:flutter/material.dart';

import 'start_view.dart';

class StartPresenter {
  final StartView _view;

  final _setUserCase=UserModule.setUserCase;

  StartPresenter(this._view);

  void login({ @required String name, @required String password}) {
    _setUserCase.setUser(
      name: name,
      password: password,
    ).then((_) {
      _view.onLoginSuccess();
    });
  }

}