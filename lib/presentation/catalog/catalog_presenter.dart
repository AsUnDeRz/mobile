import 'package:catalog_app/internal/dependencies/application_component.dart';

import 'catalog_view.dart';

class CatalogPresenter {
  final CatalogView _view;
  final _resetUserCase = UserModule.resetUserCase;
  final _getListOfferCase = OfferModule.getListOfferCase;

  CatalogPresenter(this._view);

  void getCatalog() {
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