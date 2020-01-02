import 'package:flutter/material.dart';

import 'package:catalog_app_bloc/presentation/design/application_design.dart';
import 'package:catalog_app_bloc/presentation/cart_action/cart_action_widget.dart';
import 'package:catalog_app_bloc/domain/model/offer.dart';
import 'package:catalog_app_bloc/presentation/detail/offer_widget/offer_widget.dart';

class DetailScreen extends StatelessWidget {
  final Offer _offer;

  DetailScreen(this._offer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle('Description'),
          centerTitle: true,
          actions: <Widget>[
            CartActionWidget(),
          ],
      ),
      body: OfferWidget(_offer),
    );
  }
}

