import 'package:catalog_app/internal/dependencies/user_module.dart';

import 'logout_view.dart';

class LogoutPresenter {
  LogoutView _view;
  final _logoutUserCase = UserModule.logoutUserCase;


  LogoutPresenter(this._view);


  void logout() {
    _logoutUserCase.resetUser()
        .then((_) => _view.onLogoutSuccess());
  }
}