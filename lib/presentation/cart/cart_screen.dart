import 'package:flutter/material.dart';


import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/start/start_screen.dart';

import 'package:catalog_app/presentation/cart_action/cart_action_widget.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/model/cart.dart';

import 'cart_presenter.dart';
import 'cart_view.dart';

class CartScreen extends StatefulWidget {

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> implements CartView{
  CartPresenter _cartPresenter;

  List<CartItem> _listItems;

  _CartScreenState() {
    _cartPresenter = CartPresenter(this);
  }

  @override
  void initState() {
  _cartPresenter.getCartListItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  Widget _getAppBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      title: _getTitleBar(),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: <Widget>[
        CartActionWidget(),
      ],
    );
  }

  Widget _getTitleBar() {
    return Text(
      'Корзина',
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget _getBody() {
    if(_listItems==null) {
      return LoaderPage();
    }
    else {
      return Container(
        child: _getList(),
      );
    }

  }

  Widget _getList(){
    return ListView(
      padding:  EdgeInsets.all(5),
      children: _listItems
          .map((item) => _getCard(item))
          .toList(),
    );
  }

  Widget _getCard(CartItem item) {
    return  Card(
        elevation: 5,
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: _getImageItem(item.image),
            ),
            Expanded(
              child: _getTitleItem(item.title),
            ),
            Expanded(
              child: _getPriceItem(item.price),
            ),
           ],
        ),
      ),
    );
  }

  Widget _getImageItem(String image) {
    return Image.asset(image, height: 50.0,);
  }

  Widget _getTitleItem(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }

  Widget _getPriceItem(double price) {
    return Text(
      MoneyHelper.formatMoney(price),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }

  @override
  void onError(String error) {
    // TODO: implement onError
  }

  @override
  void onLogoutSuccess() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StartScreen()));
  }

  @override
  void onReceivedCartItems(List<CartItem> listItems) {
    setState(() {
      _listItems=listItems;
    });
  }

}
