import 'dart:async';

import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:catalog_app/domain/model/cart.dart';

import 'catalog_view.dart';


class CatalogPresenter {
  final CatalogView _view;
  final _resetUserCase=UserModule.resetUserCase;
  final _getListOfferCase=OfferModule.getListOffCase;
  final _getCartStreamCase=CartModule.getCartStreamCase;
  StreamSubscription<Cart> _cartSubscription;


  CatalogPresenter(this._view);

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

  void getDummyCatalog() {
    _getListOfferCase.getListOffer()
       .then((list) {
          _view.onCatalogReceived(list);
   });
  }

  void logout() {
    _resetUserCase.resetUser()
        .then((_) {
      _view.onLogoutSuccess();
    });
  }

}