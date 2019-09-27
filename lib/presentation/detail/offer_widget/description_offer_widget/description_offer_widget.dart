import 'package:flutter/material.dart';

class DescriptionOfferWidget extends StatelessWidget {
  final String _description;

  DescriptionOfferWidget(this._description);

  @override
  Widget build(BuildContext context) =>
      Row(
        children: <Widget>[
          Expanded(
            child: Text(
              _description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      );
}