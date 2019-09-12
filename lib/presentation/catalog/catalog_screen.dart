import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/start/start_screen.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/presentation/design/loader_view.dart';
import 'package:catalog_app/presentation/detail/detail_screen.dart';
import 'package:catalog_app/presentation/cart_action/cart_action_widget.dart';
import 'package:catalog_app/presentation/design/dialog/count_good/count_good_widget.dart';

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
    _listOffer=null;
    _isLoading = true;
  }

  @override
  void initState() {
    _catalogPresenter.getCatalog();
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
      leading:
      _getIconLogout(),
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
      'Каталог',
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget _getIconLogout(){
    return IconButton(
      icon: Icon(Icons.exit_to_app),
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
    } else {
      return Container(
        child: _getList(),
      );
    }
  }

  Widget _getList(){
    return ListView(
      padding:  EdgeInsets.all(5),
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
                child: _getCardInfo(offer),
              ),
            ],
          ),
          onTap: () => onRouteDetail(offer),
        )
      );
  }

  Widget _getCardInfo(Offer offer) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           _getTitleOffer(offer),
            Container(height: 5.0,),
            _getCategoryOffer(offer),
            Container(height: 5.0),
            _getDescriptionOffer(offer),
            _getBuyAreaOffer(offer),
          ],
      ),
    );
  }

  Widget _getTitleOffer(Offer offer) {
    return  Text(
      offer.title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }

  Widget _getCategoryOffer(Offer offer) {
    return Text(
      offer.category,
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget _getDescriptionOffer(Offer offer) {
    return Container(
      height: 50.0,
      child: Text(
        offer.description,
      ),
    );
  }

  Widget _getBuyAreaOffer(Offer offer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _getTextPriceOffer(offer),
        Container(height: 5.0),
        _getPriceOffer(offer),
        _getButtonBuyOffer(offer),
      ],
    );
  }

  Widget _getTextPriceOffer(Offer offer) {
    return Text(
      'Стоимость: ',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }

  Widget _getButtonBuyOffer(Offer offer) {
    return FlatButton(
      color: Colors.blue,
      child: Text(
        'Купить',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: ()=>onChooseCountGoods(offer),
    );
  }

  Widget _getImageCard(String image) {
    return Image.asset(image);
  }

  Widget _getPriceOffer(Offer offer) {
    return Text(
      MoneyHelper.formatMoney(offer.price),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }

  @override
  void onError( error) {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: Text('Результат рулетки'),
        content: Text(error.toString()),
        actions: <Widget>[
          PlatformDialogAction(
            android: (_) => MaterialDialogActionData(),
            ios: (_) => CupertinoDialogActionData(),
            child: PlatformText('Попробовать снова'),
            onPressed: onRefreshCatalog,
          ),
        ],
      ),
    );
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
  void onChooseCountGoods(Offer offer) {
    showPlatformDialog(
      context: context,
      builder: (_) => CountGoodWidget(offer),
    );
  }

  @override
  void onRefreshCatalog() {
    Navigator.pop(context);
    _catalogPresenter.getCatalog();
  }
}