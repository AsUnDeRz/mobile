
import 'package:catalog_app/presentation/catalog/list_offers/card_offer/card_offer_info/card_offer_info.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/detail/detail_screen.dart';
import 'package:catalog_app/presentation/catalog/list_offers/card_offer/card_offer_image.dart';


class CardOfferWidget extends StatefulWidget {
  final offer;
  CardOfferWidget(this.offer);

  @override
  _CardOfferWidgetState createState() => _CardOfferWidgetState();
}

class _CardOfferWidgetState extends State<CardOfferWidget> with SingleTickerProviderStateMixin {

  GlobalKey _key;
  double _height;

  _CardOfferWidgetState() {
    _key = GlobalKey();
    _height=null;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Row(
          children: <Widget>[
            Spacer(flex: 1),
            Expanded(
              flex: 20,
              child: Container(
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: (_height == null)
                      ? LoaderPage()
                      : CardOfferImage(widget.offer.image, _height),
                ),
              ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 10,
              child:  CardOfferInfo(widget.offer, _key),
              ),
            Spacer(flex: 1),
          ],
        ),
      ),
      onTap: () => _onRouteDetail(widget.offer),
    );
  }

  void _afterLayout(_) {
    final RenderBox renderBoxRed = _key.currentContext.findRenderObject();
    setState(() {
      _height = renderBoxRed.size.height;
    });
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
