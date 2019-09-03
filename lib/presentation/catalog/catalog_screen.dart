import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/start/start_screen.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/presentation/design/loader_view.dart';


import 'catalog_presenter.dart';
import 'catalog_view.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> implements CatalogView {
  CatalogPresenter _catalogPresenter;
  List<Offer> _listOffer;
  bool _isLoading;

  _CatalogScreenState() {
    _catalogPresenter = CatalogPresenter(this);
    _catalogPresenter.getDummyCatalog();
    _listOffer=null;
    _isLoading = true;
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
      title: _getTitleBar(),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: <Widget>[
        _getIconLogout(),
      ],
    );
  }

  Widget _getTitleBar() {
    return Text(
      'Каталог',
      style: TextStyle(
        color: Colors.black.withOpacity(0.6),
      ),
    );
  }

  Widget _getIconLogout(){
    return IconButton(
      icon: const Icon(Icons.exit_to_app),
      tooltip: 'favorite',
      color: Colors.lightBlueAccent,
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
    return Card(
      elevation: 5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _getImageCard(offer.image),
          ),
          Expanded(
            child: _getCardInfo(offer.title,offer.category),
          ),
        ],
      ),
    );
  }

  Widget _getCardInfo( String title, String category) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.blue,
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
}