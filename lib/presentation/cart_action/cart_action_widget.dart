import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:flutter/material.dart';


import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/presentation/design/loader_view.dart';
import 'package:catalog_app/presentation/cart/cart_screen.dart';


import 'cart_action_presenter.dart';
import 'cart_action_view.dart';

class CartActionWidget extends StatefulWidget {
  @override
  _CartActionWidgetState createState() => _CartActionWidgetState();
}

class _CartActionWidgetState extends State<CartActionWidget> implements CartActionView {
  CartActionPresentor _cartActionPresenter;
  Cart _cart;

  _CartActionWidgetState() {
    _cartActionPresenter = CartActionPresentor(this);
  }

  @override
  void initState() {
    _cartActionPresenter.startCartStream();
    super.initState();
  }

  @override
  void dispose() {
    _cartActionPresenter.stopCartStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getCart();
  }

  Widget _getCart() {
    return FlatButton(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
          _getCartInfo(_cart),
        ],
      ),
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));},
    );
  }

  Widget _getCartInfo(Cart cart) {
    if (cart != null) {
      return Text(
        MoneyHelper.formatMoney(cart.sum),
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
      );
    } else {
      return LoaderPageStandard();
    }
  }

  @override
  void onError(String error) {
    // TODO: implement onError
  }

  @override
  void onCartUpdated(Cart cart) {
    setState(() {
      _cart = cart;
    });
  }
}