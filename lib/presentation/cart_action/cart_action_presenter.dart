import 'dart:async';

import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:catalog_app/domain/model/cart.dart';

import 'cart_action_view.dart';


class CartActionPresentor {
  final CartActionView _view;
  final _getCartStreamCase=CartModule.getCartStreamCase;
  StreamSubscription<Cart> _cartSubscription;

  CartActionPresentor(this._view);

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