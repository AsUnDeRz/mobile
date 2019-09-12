import 'package:catalog_app/internal/dependencies/seller_module.dart';

import 'seller_widget_view.dart';


class SellerBlockDetailPresenter {
  final SellerBlockDetailView _view;
  final _getSellerByIdCase=SellerModule.getSellerByIdCase;

  void getSellerById(int id) {
    _getSellerByIdCase.getSellerById(id)
        .then((seller) => _view.onSellerReceived(seller));
  }

  SellerBlockDetailPresenter(this._view);


}