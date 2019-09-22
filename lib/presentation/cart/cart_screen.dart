import 'package:catalog_app/presentation/cart/cart_sum.dart';
import 'package:catalog_app/presentation/cart/list_cart_items/list_cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/presentation/design/application_design.dart';

import 'cart_presenter.dart';
import 'cart_view.dart';

class CartScreen extends StatefulWidget {

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> implements CartView{

  CartPresenter _cartPresenter;

  Cart _cart;

  _CartScreenState() {
    _cartPresenter = CartPresenter(this);
  }

  @override
  void initState() {
  _cartPresenter.startCartStream();
    super.initState();
  }

  @override
  void dispose() {
    _cartPresenter.stopCartStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: AppBarTitle('Корзина'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          CartSum(_cart),
        ],
      ),
      body: ListCartItems(_cart),
    );
  }

  @override
  void onCartUpdated(Cart cart) {
    setState(() {
      _cart = cart;
    });
  }

  void onError(dynamic error) {
    ErrorDialogWidget.showErrorDialog(context);
  }
}
