import 'dart:async';

import 'package:catalog_app/internal/dependencies/cart_module.dart';
import 'package:catalog_app/domain/model/cart.dart';

import 'cart_view.dart';

class CartPresenter {

  final CartView _view;
  final _getCartStreamCase=CartModule.getCartStreamCase;
  final _deleteCartCase=CartModule.deleteCartCase;
  final _clearCartCase=CartModule.clearCartCase;
  StreamSubscription<Cart> _cartSubscription;

  CartPresenter(this._view);

  void deleteCartItem(int id) {
     _deleteCartCase.deleteCartItem(id);
  }

  void clearCart() {
     _clearCartCase.clearCart();
  }

  void startCartStream() {
    _cartSubscription = _getCartStreamCase
        .getCartStream()
        .listen(
      _view.onCartUpdated,
      onError: (error) => _view.onError(error.toString()),
    );
  }

  void stopCartStream() {
    if (_cartSubscription != null) {
      _cartSubscription.cancel();
      _cartSubscription = null;
    }
  }
}