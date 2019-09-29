import 'package:catalog_app/presentation/menu_drawer/menu_drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/cart_action/cart_sum_action_widget.dart';
import 'package:catalog_app/presentation/cart/list_cart_items/list_cart_item_widget.dart';

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
        title: AppBarTitle('Корзина'),
        centerTitle: true,
        actions: [
          CartSumActionWidget(_cart),
        ],
      ),
      drawer: MenuDrawerWidget(),
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
