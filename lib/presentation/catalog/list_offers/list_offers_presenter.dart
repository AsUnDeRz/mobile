import 'package:catalog_app/internal/dependencies/application_component.dart';

import 'list_offers_view.dart';

class ListOffersPresenter {

  final ListOffersView _view;
  final _getListOfferCase = OfferModule.getListOfferCase;

  ListOffersPresenter(this._view);

  void getCatalog() {
    _getListOfferCase
        .getListOffer()
        .then((list) => _view.onCatalogReceived(list))
        .catchError(_view.onError);
  }
}