import 'package:flutter/material.dart';

class SellerDescription extends StatelessWidget{
  final String _name;
  final String _type;
  final String _info;

  SellerDescription(this._name, this._type, this._info);

  @override
  Widget build(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getSellerName(),
          Container(height: 5,),
          _getSellerType(),
          Container(height: 5,),
          _getSellerInfo(),
        ],
      );

  Widget _getSellerName() =>
      Text(
        _name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _getSellerType() => Text(_type);
  Widget _getSellerInfo() => Text(_info);
}