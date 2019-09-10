import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/model/cart_item.dart';

import 'catalog_view.dart';


class CatalogPresenter {
  final CatalogView _view;
  final _resetUserCase = UserModule.resetUserCase;
  final _getListOfferCase = OfferModule.getListOffCase;
  final _addCartItemCase = CartModule.addCartItemCase;

  CatalogPresenter(this._view);

  void addItem(Offer offer) {
    _addCartItemCase
        .addCartItem(CartItem(offer.title, offer.image, offer.price));
  }

  void getDummyCatalog() {
    _getListOfferCase
        .getListOffer()
        .then((list) => _view.onCatalogReceived(list))
        .catchError(_view.onError);
  }

  void logout() {
    _resetUserCase.resetUser()
        .then((_) {
          _view.onLogoutSuccess();
        });
  }

}