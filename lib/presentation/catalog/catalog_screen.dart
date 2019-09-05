import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:flutter/material.dart';


import 'package:catalog_app/presentation/start/start_screen.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/presentation/design/loader_view.dart';
import 'package:catalog_app/presentation/detail/detail_screen.dart';


import 'catalog_presenter.dart';
import 'catalog_view.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> implements CatalogView {
  CatalogPresenter _catalogPresenter;
  List<Offer> _listOffer;
  Cart _cart;
  bool _isLoading;

  _CatalogScreenState() {
    _catalogPresenter = CatalogPresenter(this);
    _listOffer=null;
    _isLoading = true;
  }

  @override
  void initState() {
    _catalogPresenter.startCartStream();
    _catalogPresenter.getDummyCatalog();
    super.initState();
  }

  @override
  void dispose() {
    _catalogPresenter.stopCartStream();
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
      leading:
      _getIconLogout(),
      title: _getTitleBar(),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: <Widget>[
        _getIconCart(),
      ],
    );
  }

  Widget _getIconCart() {
    return FlatButton(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.blue,
            ),
          ),
          _getCartInfo(_cart),
        ],
      ),
      onPressed: () => {},
    );
  }

  Widget _getCartInfo(Cart cart) {
    String str= strMoney(cart.sum);
    return Text(
      '$str',
      style: TextStyle(
          fontSize: 20.0,
          color: Colors.blue,
      ),
    );
  }


  Widget _getTitleBar() {
    return Text(
      'Каталог',
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget _getIconLogout(){
    return IconButton(
      icon: const Icon(Icons.exit_to_app),
      tooltip: 'favorite',
      color: Colors.black,
      onPressed: () {
        _catalogPresenter.logout();
      },
    );
  }

  Widget _getBody() {
    if(_isLoading) {
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
      children: _listOffer
          .map((item) => _getCard(item))
          .toList(),
    );
  }

  Widget _getCard(Offer offer) {
    return   Card(
        elevation: 5,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: _getImageCard(offer.image),
              ),
              Expanded(
                child: _getCardInfo(offer.title,offer.category, offer.price),
              ),
            ],
          ),
          onTap:(){
            onRouteDetail(offer);
          },
        )
      );
  }

  Widget _getCardInfo( String title, String category, double price) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Container(
            height: 10.0,
          ),
          Text(
            category,
            style: TextStyle(
              color: Colors.grey
            ),
          ),
          Container(
            height: 50.0,
          ),
          Text(
            'Стоимость: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Container(
            height: 5.0,
          ),
          Text(
            strMoney(price),
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getImageCard(String image) {
    return Image.asset(image);
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
  void onCatalogReceived(List<Offer> catalog) {
    setState(() {
      _isLoading=false;
      _listOffer=catalog;
    });
  }

  @override
  void onRouteDetail(Offer offer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(offer),
      ),
    );
  }

  @override
  void onCartUpdated(Cart cart) {
    setState(() {
      _cart = cart;
    });
  }
}