import 'package:catalog_app/presentation/catalog/list_offers/list_offers_widget.dart';
import 'package:catalog_app/presentation/menu_drawer/menu_drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/cart_action/cart_action_widget.dart';

class CatalogScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),//
        title: AppBarTitle('Каталог'),
        centerTitle: true,
        actions: <Widget>[
          CartActionWidget(),
        ],
      ),
      drawer: MenuDrawerWidget(),
      body: ListOffersWidget(),
    );
  }
}