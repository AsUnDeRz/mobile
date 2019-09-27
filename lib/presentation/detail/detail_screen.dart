import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/cart_action/cart_action_widget.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/presentation/detail/offer_widget/offer_widget.dart';

class DetailScreen extends StatelessWidget {
  final Offer _offer;

  DetailScreen(this._offer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle('Описание'),
          centerTitle: true,
          actions: <Widget>[
            CartActionWidget(),
          ],
      ),
      body: OfferWidget(_offer),
    );
  }
}

