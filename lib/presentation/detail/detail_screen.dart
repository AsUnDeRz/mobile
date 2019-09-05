import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:flutter/material.dart';


import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/model/cart.dart';

import 'detail_presenter.dart';
import 'detail_view.dart';

class DetailScreen extends StatefulWidget {
  final Offer _offer;

  DetailScreen(this._offer);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> implements DetailView{
  DetailPresenter _detailPresenter;

  Cart _cart;

  _DetailScreenState() {
    _detailPresenter = DetailPresenter(this);
  }

  @override
  void initState() {
    _detailPresenter.startCartStream();
    super.initState();
  }

  @override
  void dispose() {
    _detailPresenter.stopCartStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,),
        backgroundColor: Colors.blue,
        onPressed: () => _detailPresenter.addItem(widget._offer.price),
      ),
    );
  }

  Widget _getAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
        'Описание',
          style: TextStyle (
            color: Colors.black
          ),
      ),
      centerTitle: true,
      actions: <Widget>[
        _getIconCart(),
      ]
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
                color:Colors.blue
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
          color:Colors.blue
      ),
    );
  }

  Widget _getBody() {
    return Container(
      child: _getContent(widget._offer),
    );
  }

  Widget _getContent(Offer offer){
    List<Function> listBlocks= [
      _titleProduct,
      _priceProduct,
      _descriptionProduct,
      _charactersProduct,
      _labelProduct,
      _sellerProduct,
    ];
    return  ListView.builder(
      itemCount: listBlocks.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          child: Function.apply(listBlocks[index], [offer]),
        );
      },
    );
  }

  Widget _titleProduct (Offer offer) {
    return Row(
        children: [
          Text(
            offer.title,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      );
  }

  Widget _priceProduct (Offer offer) {
    return Row(
      children: [
        Text(
          strMoney(offer.price),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  Widget _descriptionProduct (Offer offer) {
    return  Row(
      children: [
        Expanded(
          child: Text(
            offer.description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          iconSize: 14.0,
          onPressed: ()=>{},
          color: Colors.grey[500],
        ),
      ],
    );
  }

  Widget _charactersProduct (Offer offer) {
    return Column(
      children: _getListCharacter(offer),
    );
  }

  List<Widget> _getListCharacter(Offer offer){
    return offer
        .characters
        .entries
        .map((entry) => _getRowCharacter(entry.key, entry.value))
        .toList(growable: false);
  }

  Widget _getRowCharacter(String k, String v){
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              k,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(v),
          ),
        ],
      ),
    );
  }

  Widget _labelProduct (Offer offer) {
    return Text(
      offer.category,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _sellerProduct (Offer offer) {
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
         _getSellerInfo(offer),
          _getSellerImage(offer),
        ],
      ),
    );
  }

  Widget _getSellerInfo(Offer offer){
    return Expanded(
        flex: 6,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  offer.seller.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(offer.seller.type),
              ],
            ),
            Row(
              children: <Widget>[
                Text(offer.seller.info),
              ],
            ),
          ],
        )
    );
  }

  Widget _getSellerImage(Offer offer){
    return Expanded(
      flex: 2,
      child: _getAvatar(offer),
    );
  }

  Widget _getAvatar(Offer offer) {
    String img = offer.seller.image.isEmpty ? 'assets/images/seller.png' : offer
        .seller.image;
    return Image.asset(
      img,
      height: 75.0,
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
