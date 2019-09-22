import 'package:flutter/material.dart';

import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/design/dialog/count_good/count_good_widget.dart';
import 'package:catalog_app/presentation/detail/detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardOfferWidget extends StatefulWidget {
  final offer;
  CardOfferWidget(this.offer);

  @override
  _CardOfferWidgetState createState() => _CardOfferWidgetState();
}

class _CardOfferWidgetState extends State<CardOfferWidget> {
  @override
  Widget build(BuildContext context) => InkWell(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: _getImageCard(widget.offer.image),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 10,
              child: _getCardInfo(widget.offer),
            ),
          ],
        ),
        onTap: () => onRouteDetail(widget.offer),
      );

  Widget _getCardInfo(Offer offer) => Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getTitleOffer(offer),
            Container(
              height: 5.0,
            ),
            _getCategoryOffer(offer),
            Container(height: 5.0),
            _getDescriptionOffer(offer),
            _getBuyAreaOffer(offer),
          ],
        ),
      );

  Widget _getTitleOffer(Offer offer) => Text(
        offer.title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      );

  Widget _getCategoryOffer(Offer offer) {
    return Text(
      offer.category,
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget _getDescriptionOffer(Offer offer) {
    return Container(
      height: 50.0,
      child: Text(
        offer.description,
      ),
    );
  }

  Widget _getBuyAreaOffer(Offer offer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _getTextPriceOffer(offer),
        Container(height: 5.0),
        _getPriceOffer(offer),
        _getButtonBuyOffer(offer),
      ],
    );
  }

  Widget _getTextPriceOffer(Offer offer) {
    return Text(
      'Стоимость: ',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }

  Widget _getButtonBuyOffer(Offer offer) {
    return FlatButton(
      color: Colors.blue,
      child: Text(
        'Купить',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () => onChooseCountGoods(offer),
    );
  }

  Widget _getImageCard(String image) => CachedNetworkImage(
        placeholder: (context, url) => LoaderPage(),
        imageUrl: image,
        fit: BoxFit.cover,
      );

  Widget _getPriceOffer(Offer offer) {
    return Text(
      MoneyHelper.formatMoney(offer.price),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }

  void onRouteDetail(Offer offer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(offer),
      ),
    );
  }

  void onChooseCountGoods(Offer offer) {
    showPlatformDialog(
      context: context,
      builder: (_) => CountGoodWidget(offer),
    );
  }
}
