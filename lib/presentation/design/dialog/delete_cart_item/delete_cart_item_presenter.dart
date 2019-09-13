import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:catalog_app/domain/model/cart_item.dart';

import 'delete_cart_item_view.dart';

class DeleteCartItemPresenter {
  final DeleteCartItemView _view;

  final _deleteCartItemCase = CartModule.deleteCartCase;

  DeleteCartItemPresenter(this._view);

  void deleteItem(int id) {
    _deleteCartItemCase.deleteCartItem(id)
    .then((_)=>_view.onAcceptDelete());
  }
}