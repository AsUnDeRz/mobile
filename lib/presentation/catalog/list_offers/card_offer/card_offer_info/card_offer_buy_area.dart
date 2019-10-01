import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/design/dialog/count_good/count_good_widget.dart';
import 'package:flutter/material.dart';

class CardOfferBuyArea extends StatefulWidget {
  final Offer offer;

  CardOfferBuyArea(this.offer);

  @override
  _CardOfferBuyAreaSate createState() => _CardOfferBuyAreaSate();
}

class _CardOfferBuyAreaSate extends State<CardOfferBuyArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _getTextPriceOffer(),
        Container(height: 5.0),
        _getPriceOffer(widget.offer.price),
        _getButtonBuyOffer(widget.offer),
      ],
    );
  }

  Widget _getTextPriceOffer() {
    return Text(
      'Стоимость: ',
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _getButtonBuyOffer(Offer offer) {
    return Button(
      label: 'Купить',
      handler: () => _onChooseCountGoods(offer),
    );
  }

  Widget _getPriceOffer(double price) {
    return Text(
      MoneyHelper.formatMoney(price),
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  void _onChooseCountGoods(Offer offer) async {
    await showPlatformDialog(
      context: context,
      builder: (_) => CountGoodWidget(CartItem.fromOffer(offer)),
    );
  }
}