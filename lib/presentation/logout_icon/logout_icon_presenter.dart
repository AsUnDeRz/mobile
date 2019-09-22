import 'package:catalog_app/internal/dependencies/user_module.dart';

import 'logout_icon_view.dart';

class LogoutIconPresenter {
  LogoutIconView _view;

  LogoutIconPresenter(this._view);

  final _resetUserCase = UserModule.resetUserCase;

  void logout() {
    _resetUserCase.resetUser()
        .then((_) => _view.onLogoutSuccess());
  }
}