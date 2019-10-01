import 'package:flutter/material.dart';

class CategoryOfferWidget extends StatelessWidget {
  final String _category;

  CategoryOfferWidget(this._category);

  @override
  Widget build(BuildContext context) {
    return Text(
      _category,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}