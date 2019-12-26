import 'package:flutter/material.dart';

import 'package:catalog_app_bloc/domain/model/offer.dart';
import 'package:catalog_app_bloc/presentation/detail/detail_screen.dart';
import 'package:catalog_app_bloc/presentation/catalog/list_offers/card_offer/card_offer_image.dart';
import 'package:catalog_app_bloc/presentation/catalog/list_offers/card_offer/card_offer_info/card_offer_info.dart';

class CardOfferWidget extends StatefulWidget {
  final offer;
  CardOfferWidget(this.offer);

  @override
  _CardOfferWidgetState createState() => _CardOfferWidgetState();
}

class _CardOfferWidgetState extends State<CardOfferWidget> with SingleTickerProviderStateMixin {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Theme.of(context).cardColor,
      child: InkWell(
        child: Row(
          children: <Widget>[
            Spacer(flex: 1),
            Expanded(
              flex: 20,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: AspectRatio(
                  aspectRatio: 4/3.5,
                  child: CardOfferImage(widget.offer.image),
                ),
              ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 10,
              child:  CardOfferInfo(widget.offer),
              ),
            Spacer(flex: 1),
          ],
        ),
        onTap: () => _onRouteDetail(widget.offer),
      ),
    );
  }

  void _onRouteDetail(Offer offer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(offer),
      ),
    );
  }
}
