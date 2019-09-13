import 'package:catalog_app/internal/dependencies/application_component.dart';

import 'delete_all_cart_item_view.dart';

class DeleteAllCartItemsPresenter {
  final DeleteAllCartItemsView _view;

  final _clearCartCase = CartModule.clearCartCase;

  DeleteAllCartItemsPresenter(this._view);

  void deleteItems() {
    _clearCartCase.clearCart()
    .then((_)=>_view.onAcceptDelete());
  }
}