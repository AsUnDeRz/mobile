import 'package:flutter/material.dart';

class SellerAvatar extends StatelessWidget{
  final String _avatar;

  SellerAvatar(this._avatar);

  @override
  Widget build(BuildContext context)  =>
      Image.asset(
        _avatar,
        height: 75.0,
      );

}