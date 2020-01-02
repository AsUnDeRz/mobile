import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:catalog_app_bloc/domain/model/cart_item.dart';
import 'package:catalog_app_bloc/domain/model/offer.dart';
import 'package:catalog_app_bloc/presentation/design/application_design.dart';
import 'package:catalog_app_bloc/presentation/design/dialog/count_good/count_good_widget.dart';

class HeaderOfferWidget extends StatefulWidget{
  final Offer offer;

  HeaderOfferWidget(this.offer);

  @override
  _HeaderOfferWidgetState createState() => _HeaderOfferWidgetState();
}

class _HeaderOfferWidgetState extends State<HeaderOfferWidget> {

  @override
  Widget build(BuildContext context) {
    final offer = widget.offer;
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: _getImage(offer.image),
          ),
          Expanded(
            child: _getInfo(offer),
          ),
        ],
      ),
    );
  }

  Widget _getImage(String image) =>
      Column(
        children: <Widget>[
          CachedNetworkImage(
            placeholder: (context, url) => LoaderPage(),
            imageUrl: image,
          ),
        ],
      );

  Widget _getInfo(Offer offer) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _getTitle(offer.title),
            Container(height: 10,),
            _getPrice(offer.price),
            Container(height: 10,),
            _getButtonBuy(offer),
          ],
        ),
      );
  }

  Widget _getTitle(String title) {
    return Text(
        title,
        style: TextStyle(
          fontSize: 24,
        ),
      );
  }

  Widget _getPrice(double price) {
    return Text(
        MoneyHelper.formatMoney(price),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      );
  }

  Widget _getButtonBuy(Offer offer) {
    return Button(
      label: 'Buy',
      handler: () => _onChooseCountGoods(offer),
    );
  }

  void _onChooseCountGoods(Offer offer) =>
      showPlatformDialog(
        context: context,
        builder: (_) => CountGoodWidget(CartItem.fromOffer(offer)),
      );
}