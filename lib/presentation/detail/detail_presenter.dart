import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/model/offer.dart';

import 'detail_view.dart';

class DetailPresenter {
  // ignore: unused_field
  final DetailView _view;

  final _addCartItemCase = CartModule.addCartItemCase;

  DetailPresenter(this._view);


  void addItem(Offer offer) {
    _addCartItemCase.addCartItem(CartItem(offer.title, offer.image, offer.price));
  }
}