import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:catalog_app/domain/model/cart_item.dart';


import 'detail_view.dart';

class DetailPresenter {
  final DetailView _view;

  final _addCartItemCase = CartModule.addCartItemCase;

  DetailPresenter(this._view);

  void addItem(CartItem item) {
    _addCartItemCase.addCartItem(item)
    .catchError( (error)=>_view.onError(error));
  }
}