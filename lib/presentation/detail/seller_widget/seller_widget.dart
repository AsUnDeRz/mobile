import 'package:flutter/material.dart';

import 'package:catalog_app_bloc/presentation/detail/seller_widget/seller_avatar.dart';
import 'package:catalog_app_bloc/presentation/detail/seller_widget/seller_description.dart';
import 'package:catalog_app_bloc/domain/model/seller.dart';


class SellerWidget extends StatefulWidget{
  final Seller _seller;

  SellerWidget(this._seller);

  @override
  _SellerWidgetState createState() => _SellerWidgetState();
}

class _SellerWidgetState extends State<SellerWidget> {
  @override
  Widget build(BuildContext context) {
    return _body(widget._seller);
  }

  Widget _body (Seller seller) {
    return Container(
      color: Theme.of(context).cardColor,
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
      child: SellerAvatar(seller.image),
    );
  }

  Widget _getSellerDescription(Seller seller) =>
      Expanded(
        flex: 6,
        child: SellerDescription(seller.name, seller.type, seller.info),
      );
}