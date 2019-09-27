
import 'package:catalog_app/internal/dependencies/application_component.dart';

class MenuDrawerPresentation {

  final _view;
  final _logoutUserCase = UserModule.logoutUserCase;

  MenuDrawerPresentation(this._view);

  void logout() {
    _logoutUserCase.resetUser()
        .then((_) => _view.onLogoutSuccess());
  }
}