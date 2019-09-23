import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/domain/model/cart.dart';

class CartSumActionWidget extends StatelessWidget {

  final Cart _cart;

  CartSumActionWidget(this._cart);

  @override
  Widget build(BuildContext context) {
    if(_cart != null){
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            'Итого: ${MoneyHelper.formatMoney(_cart.sum)}',
            style: TextStyle (
              color: Colors.black,
            ),
          ),
        ),
      );
    }
    else {
      return Container();
    }
  }
}