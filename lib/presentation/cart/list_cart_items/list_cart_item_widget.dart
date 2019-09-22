import 'package:flutter/material.dart';

import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/presentation/cart/list_cart_items/cart_item_widget.dart';
import 'package:catalog_app/presentation/design/application_design.dart';

class ListCartItems extends StatefulWidget {

  final Cart cart;

  ListCartItems(this.cart);

  @override
  _ListCartItemsState createState() => _ListCartItemsState();
}

class _ListCartItemsState extends State<ListCartItems> {

  @override
  Widget build(BuildContext context) {
    final cart =  widget.cart;
    if(cart != null && cart.listItems.length > 0) {
      return ListView(
          padding: EdgeInsets.all(5),
          children:[
            ..._getListItems(cart),
            ..._getButtonDeleteAllCartItems(),
          ]
      );
    }
    else {
      return Center (
        child: Text(
          'Корзина пуста',
        ),
      );
    }
  }

  List<Widget> _getListItems(Cart cart) {
    return cart.listItems
        .map((cartItem) => CartItemWidget(cartItem))
        .toList();
  }

  List<Widget> _getButtonDeleteAllCartItems() {
    return <Widget> [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              color: Colors.redAccent,
              child: Text(
                'Удалить все товары',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: onClearCart,
            ),
          ],
        ),
      ),
    ];
  }

  void onClearCart() {
    showPlatformDialog(
      context: context,
      builder: (_) => DeleteAllCartItemsWidget(),
    );  }

  void onError(dynamic error) {
    ErrorDialogWidget.showErrorDialog(context);
  }
}