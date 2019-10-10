import 'package:flutter/material.dart';

import 'package:catalog_app_bloc/domain/model/offer.dart';
import 'package:catalog_app_bloc/presentation/catalog/list_offers/card_offer/card_offer_info/card_offer_description.dart';

class CardOfferInfo extends StatelessWidget {
  final Offer _offer;
  final GlobalKey _key;

  CardOfferInfo(this._offer, this._key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          key: _key,
          child: CardOfferDescription(_offer)
      ),
    );
  }
}