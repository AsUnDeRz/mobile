import 'package:catalog_app/presentation/catalog/list_offers/list_offers_widget.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/logout_icon/logout_icon_widget.dart';
import 'package:catalog_app/presentation/cart_action/cart_action_widget.dart';

class CatalogScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LogoutIconWidget(),
        title: AppBarTitle('Каталог'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          CartActionWidget(),
        ],
      ),
      body: ListOffersWidget(),
    );
  }
}