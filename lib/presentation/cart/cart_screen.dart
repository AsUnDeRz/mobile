import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app_bloc/presentation/design/application_design.dart';
import 'package:catalog_app_bloc/presentation/cart_action/cart_sum_action_widget.dart';
import 'package:catalog_app_bloc/presentation/cart/list_cart_items/list_cart_item_widget.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_component.dart';
import 'package:catalog_app_bloc/domain/bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>{
  CartBloc _cartBloc = CartModule.cartBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _cartBloc,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is ReadyState) {
            return Scaffold(
              appBar: AppBar(
                title: AppBarTitle('Корзина'),
                centerTitle: true,
                actions: [CartSumActionWidget(state.cart),],
              ),
              body: ListCartItems(state.cart),
            );
          }
          return LoaderPage();
        }
      ),
    );
  }
}
