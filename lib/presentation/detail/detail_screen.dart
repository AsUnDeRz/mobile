import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/cart_action/cart_action_widget.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/presentation/detail/seller_widget/seller_widget.dart';
import 'package:catalog_app/presentation/design/dialog/count_good/count_good_widget.dart';

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

  _DetailScreenState() {
    _detailPresenter = DetailPresenter(this);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
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
        CartActionWidget(),
      ]
    );
  }

  Widget _getBody() {
    if(widget._offer == null){
      return LoaderPage();
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: _getContent(widget._offer),
      );
    }
  }

  Widget _getContent(Offer offer){
    List<Function> listBlocks= [
      _getHeader,
      _descriptionProduct,
      _charactersOffer,
      _categoryOffer,
      _sellerOffer,
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

  Widget _getHeader(Offer offer) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: _getOfferImage(offer),
            ),
          Expanded(
            child: _getMinInfo(offer),
          ),
        ],
      ),
    );
  }

  Widget _getOfferImage(Offer offer) {
    return Column(
      children: <Widget>[
        Image.asset(offer.image),
      ],
    );
  }

  Widget _getMinInfo(Offer offer) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _titleProduct(offer),
          Container(height: 10,),
          _priceProduct(offer),
          Container(height: 10,),
          _getButtonBuy(offer),
        ],
      ),
    );
  }

  Widget _titleProduct (Offer offer) {
    return Text(
      offer.title,
      style: TextStyle(
        fontSize: 24,
      ),
    );
  }

  Widget _priceProduct (Offer offer) {
    return Text(
      MoneyHelper.formatMoney(offer.price),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _getButtonBuy(Offer offer) {
    return FlatButton(
      color: Colors.blue,
      child: Text(
        'Купить',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed:  () => onChooseCountGoods(offer),
    );
  }

  Widget _descriptionProduct (Offer offer) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            offer.description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _charactersOffer (Offer offer) {
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

  Widget _getRowCharacter(String titleCharacter, String valueCharacter){
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              titleCharacter,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(valueCharacter),
          ),
        ],
      ),
    );
  }

  Widget _categoryOffer (Offer offer) {
    return Text(
      offer.category,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _sellerOffer(Offer offer) {
    return SellerBlockDetailWidget(offer.seller);
  }

  @override
  void onChooseCountGoods(Offer offer) {
    showPlatformDialog(
      context: context,
      builder: (_) => CountGoodWidget(offer),
    );
  }

  @override
  void onError(dynamic error) {
    // TODO: implement onError
  }

}
