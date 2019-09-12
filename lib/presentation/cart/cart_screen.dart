import 'package:catalog_app/domain/model/cart.dart';
import 'package:flutter/material.dart';


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
        _getCartSum(_cart),

      ],
    );
  }
//TODO
  Widget _getCartSum( Cart cart) {
    if(cart!=null){
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            'Итого: ${MoneyHelper.formatMoney(cart.sum)}',
            style: TextStyle (
              color: Colors.black,
            ),
          ),
        ),
      );
    }
    else {
      return Container();
    }

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
    if(_cart==null) {
      return LoaderPage();
    }
    else {
      return Container(
        child: _getList(),
      );
    }

  }

  Widget _getList(){
    if(_cart.listItems.length>0) {
      return ListView(
        padding: EdgeInsets.all(5),
        children: _cart.listItems
            .map((item) => _getCard(item))
            .toList(),
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
              child: _getCountItem(item.count),
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

  Widget _getCountItem(int count) {
    return Text(
      count.toString()+' шт.',
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
  void onCartUpdated(Cart cart) {
    setState(() {
      _cart = cart;
    });
  }

  @override
  void onError(String error) {
    // TODO: implement onError
  }



}
