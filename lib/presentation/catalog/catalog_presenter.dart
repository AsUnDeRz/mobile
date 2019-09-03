import 'package:catalog_app/internal/dependencies/application_component.dart';

import 'catalog_view.dart';

class CatalogPresenter {
  final CatalogView _view;
  final _resetUserCase=UserModule.resetUserCase;
  final _getListOfferCase=OfferModule.getListOffCase;

  CatalogPresenter(this._view);

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