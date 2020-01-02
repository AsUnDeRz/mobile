import 'package:flutter/material.dart';

import 'package:catalog_app_bloc/presentation/design/application_design.dart';
import 'package:catalog_app_bloc/presentation/cart_action/cart_action_widget.dart';
import 'package:catalog_app_bloc/presentation/catalog/list_offers/list_offers_widget.dart';
import 'package:catalog_app_bloc/presentation/menu_drawer/menu_drawer_widget.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle('Catalog'),
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