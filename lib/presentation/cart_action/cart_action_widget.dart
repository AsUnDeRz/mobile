import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app_bloc/domain/bloc/cart_action_bloc.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_component.dart';
import 'package:catalog_app_bloc/domain/model/cart.dart';
import 'package:catalog_app_bloc/presentation/design/loader_view.dart';
import 'package:catalog_app_bloc/presentation/cart/cart_screen.dart';
import 'package:catalog_app_bloc/presentation/design/application_design.dart';

class CartActionWidget extends StatefulWidget {
  @override
  _CartActionWidgetState createState() => _CartActionWidgetState();
}

class _CartActionWidgetState extends State<CartActionWidget>{
  CartActionBloc _cartActionBloc = CartModule.cartActionBloc();

  @override
  void dispose() {
    _cartActionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartActionBloc, CartActionState>(
      bloc: _cartActionBloc,
      builder: (context, state) {
        if (state is ReadyCartActionState) {
          return _getCart(state.cart);
        }
        return LoaderPage();
      },
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