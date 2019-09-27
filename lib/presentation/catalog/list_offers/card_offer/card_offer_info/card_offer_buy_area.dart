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
  Widget build(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _getTextPriceOffer(),
          Container(height: 5.0),
          _getPriceOffer(widget.offer.price),
          _getButtonBuyOffer(widget.offer),
        ],
      );

  Widget _getTextPriceOffer() =>
      Text(
        'Стоимость: ',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      );

  Widget _getButtonBuyOffer(Offer offer) =>
      FlatButton(
        color: Colors.blue,
        child: Text(
          'Купить',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => _onChooseCountGoods(offer),
      );

  Widget _getPriceOffer(double price) =>
      Text(
        MoneyHelper.formatMoney(price),
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      );

  void _onChooseCountGoods(Offer offer) =>
      showPlatformDialog(
        context: context,
        builder: (_) => CountGoodWidget(offer),
      );

}