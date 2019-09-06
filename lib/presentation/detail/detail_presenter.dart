import 'package:catalog_app/internal/dependencies/application_component.dart';

import 'detail_view.dart';

class DetailPresenter {
  // ignore: unused_field
  final DetailView _view;

  final _addCartItemCase = CartModule.addCartItemCase;

  DetailPresenter(this._view);


  void addItem(double sum) {
    _addCartItemCase.addCartItem(sum);
  }
}