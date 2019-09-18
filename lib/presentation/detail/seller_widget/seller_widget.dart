import 'package:flutter/material.dart';

import 'package:catalog_app/domain/model/seller.dart';
import 'package:catalog_app/presentation/design/application_design.dart';


import 'seller_widget_presenter.dart';
import 'seller_widget_view.dart';

class SellerBlockDetailWidget extends StatefulWidget {
  final Seller seller;

  SellerBlockDetailWidget(this.seller);

  @override
  _SellerBlockDetailWidgetState createState() => _SellerBlockDetailWidgetState();
}

class _SellerBlockDetailWidgetState extends State<SellerBlockDetailWidget> implements SellerBlockDetailView {
  SellerBlockDetailPresenter _sellerBlockDetailPresenter;

  _SellerBlockDetailWidgetState() {
    _sellerBlockDetailPresenter = SellerBlockDetailPresenter(this);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return _body(widget.seller);
  }

    Widget _body (Seller seller) {
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
         _getSellerDescription(seller),
         _getSellerImage(seller),
        ],
      ),
    );
  }

  Widget _getSellerImage(Seller seller){
    return Expanded(
      flex: 2,
      child: _getAvatar(seller),
    );
  }

  Widget _getAvatar(Seller seller) {
    String img = seller.image;
    return Image.asset(
      img,
      height: 75.0,
    );
  }

  Widget _getSellerDescription(Seller seller){
    return Expanded(
      flex: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getSellerName(seller),
          Container(height: 5,),
          _getSellerType(seller),
          Container(height: 5,),
          _getSellerInfo(seller),
        ],
      ),
    );
  }

  Widget _getSellerName(Seller seller) {
    return Text(
      seller.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getSellerType(Seller seller) {
    return Text(seller.type);
  }

  Widget _getSellerInfo(Seller seller) {
    return Text(seller.info);
  }

  @override
  void onError(String error) {
    ErrorDialogWidget.showErrorDialog(context);
  }
}