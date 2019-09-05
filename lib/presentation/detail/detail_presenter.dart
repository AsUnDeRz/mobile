import 'dart:async';

import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:catalog_app/domain/model/cart.dart';


import 'detail_view.dart';

class DetailPresenter {
  final DetailView _view;

  final _getCartStreamCase = CartModule.getCartStreamCase;
  final _addCartItemCase = CartModule.addCartItemCase;
  StreamSubscription<Cart> _cartSubscription;

  DetailPresenter(this._view);


  void addItem(double sum) {
    _addCartItemCase.addCartItem(sum);
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