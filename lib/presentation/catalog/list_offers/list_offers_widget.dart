import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/presentation/design/loader_view.dart';

import 'list_offers_presenter.dart';
import 'list_offers_view.dart';
import 'card_offer_widget.dart';

class ListOffersWidget extends StatefulWidget {
  @override
  _ListOffersWidgetState createState() => _ListOffersWidgetState();
}

class _ListOffersWidgetState extends State<ListOffersWidget> implements ListOffersView {
  ListOffersPresenter _listOffersPresenter;
  List<Offer> _listOffer;

  _ListOffersWidgetState() {
    _listOffersPresenter = ListOffersPresenter(this);
    _listOffer=null;
  }

  @override
  void initState() {
    _listOffersPresenter.getCatalog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      (_listOffer == null) ? LoaderPage() : _getList();

  Widget _getList() =>
      ListView(
        padding:  EdgeInsets.all(5),
        children: [
          ..._listOffer.map((offer) => CardOfferWidget(offer))
        ],
      );

  @override
  void onError(dynamic error) =>
    ErrorDialogWidget.showErrorDialog(
        context,
        error: error,
        handlerButton: onRefreshCatalog
    );

  @override
  void onCatalogReceived(List<Offer> catalog) =>
      setState(() => _listOffer = catalog);

  @override
  void onRefreshCatalog() {
    Navigator.pop(context);
    _listOffersPresenter.getCatalog();
  }
}