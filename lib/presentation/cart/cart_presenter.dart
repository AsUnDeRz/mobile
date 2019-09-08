import 'package:catalog_app/internal/dependencies/application_component.dart';

import 'cart_view.dart';

class CartPresenter {
  // ignore: unused_field
  final CartView _view;
  final _resetUserCase=UserModule.resetUserCase;
  final _getCartItemsCase = CartModule.getCartItemsCase;

  CartPresenter(this._view);

  void getCartListItems()  async {
    _view.onReceivedCartItems( await _getCartItemsCase.getCartItems());
  }

  void logout() {
    _resetUserCase.resetUser()
        .then((_) {
      _view.onLogoutSuccess();
    });
  }

}