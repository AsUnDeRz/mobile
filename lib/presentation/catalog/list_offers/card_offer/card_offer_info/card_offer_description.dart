import 'package:flutter/material.dart';

import 'package:catalog_app_bloc/domain/model/offer.dart';
import 'package:catalog_app_bloc/presentation/catalog/list_offers/card_offer/card_offer_info/card_offer_buy_area.dart';

class CardOfferDescription extends StatelessWidget {
  final Offer offer;

  CardOfferDescription(this.offer);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _getTitle(offer.title),
        Container(
          height: 5.0,
        ),
        _getCategory(offer.category),
        Container(height: 5.0),
        _getDescription(offer.description),
        CardOfferBuyArea(offer),
      ],
    );
  }

  Widget _getTitle(String category) {
    return Text(
      offer.title,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _getCategory(String category) {
    return Text(
      offer.category,
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget _getDescription(String category) {
    return Container(
      height: 50.0,
      child: Text(
        offer.description,
      ),
    );
  }
}