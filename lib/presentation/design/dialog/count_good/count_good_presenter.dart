import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:catalog_app/domain/model/cart_item.dart';

import 'count_good_view.dart';

class CountGoodPresenter {
  final CountGoodView _view;

  final _addCartItemCase = CartModule.addCartItemCase;

  CountGoodPresenter(this._view);

  void addItem(CartItem item) {
    _addCartItemCase.addCartItem(item)
    .then((_)=>_view.onSaveCartItem());
  }
}