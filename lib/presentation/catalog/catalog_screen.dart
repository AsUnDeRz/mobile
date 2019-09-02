import 'package:flutter/material.dart';

import 'catalog_presenter.dart';
import 'catalog_view.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> implements CatalogView {
  CatalogPresenter _CatalogPresenter;
  bool _isLoading;

  _CatalogScreenState() {
    _CatalogPresenter = CatalogPresenter(this);
    _isLoading = false;
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
      onPressed: (){ },
    );
  }
  Widget _getBody() {
    return Container(
      child: _getList(),
    );
  }
  Widget _getList(){
    return ListView(
      children: <Widget>[
        _getCard(
          image: 'assets/images/good1.jpg',
          title: 'Good 1',
          category: 'category 1',
        ),
        _getCard(
          image: 'assets/images/good2.jpg',
          title: 'Good 2',
          category: 'category 2',
        ),
        _getCard(
          image: 'assets/images/good3.jpg',
          title: 'Good 3',
          category: 'category 3',
        ),
        _getCard(
          image: 'assets/images/good1.jpg',
          title: 'Good 1',
          category: 'category 1',
        ),
        _getCard(
          image: 'assets/images/good2.jpg',
          title: 'Good 2',
          category: 'category 2',
        ),
        _getCard(
          image: 'assets/images/good3.jpg',
          title: 'Good 3',
          category: 'category 3',
        ),
      ],
    );
  }
  Widget _getCard({String image, String title, String category}) {
    return Card(
      elevation: 5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _getImageCard(image),
          ),
          Expanded(
            child: _getCardInfo(title,category),
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
}