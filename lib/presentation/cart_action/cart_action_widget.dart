import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app/domain/bloc/cart_action_bloc.dart';
import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/presentation/design/loader_view.dart';
import 'package:catalog_app/presentation/cart/cart_screen.dart';
import 'package:catalog_app/presentation/design/application_design.dart';

class CartActionWidget extends StatefulWidget {
  @override
  _CartActionWidgetState createState() => _CartActionWidgetState();
}

class _CartActionWidgetState extends State<CartActionWidget>{
  CartActionBloc _cartActionBloc = CartModule.cartActionBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _cartActionBloc,
      child: BlocBuilder<CartActionBloc, CartActionState>(
        builder: (context, state) {
          if (state is CartActionReadyState) {
            return _getCart(state.cart);
          }
          return LoaderPage();
        },
      ),
    );
  }

  Widget _getCart(Cart cart){
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: _getCartInfo(cart),
            ),
          ],
        ),
      ),
      onTap: _onRouteCartScreen,
    );
  }
  
  Widget _getCartInfo(Cart cart) {
    if (cart != null) {
      return Text(
        MoneyHelper.formatMoney(cart.sum),
        style: TextStyle(
          fontSize: 20.0,
        ),
      );
    }
    return LoaderPage();
  }

  void _onRouteCartScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
  }
}