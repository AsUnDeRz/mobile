import 'package:catalog_app/domain/bloc/cart_action_bloc.dart';
import 'package:catalog_app/domain/bloc/cart_bloc.dart';
import 'package:catalog_app/domain/bloc/dialog/count_good_bloc.dart';
import 'package:catalog_app/domain/bloc/dialog/delete_all_cart_item_bloc.dart';
import 'package:catalog_app/domain/bloc/dialog/delete_cart_item_bloc.dart';

import 'cart_repository_module.dart';

class CartModule {
  static final cartActionBloc = CartActionBloc(CartRepositoryModule.cartRepository);
  static final cartBloc = CartBloc(CartRepositoryModule.cartRepository);
  static CountGoodBloc countGoodBloc() {
    return CountGoodBloc(CartRepositoryModule.cartRepository);
  }
  static DeleteAllCartItemsBloc deleteAllCartItemsBloc() {
    return DeleteAllCartItemsBloc(CartRepositoryModule.cartRepository);
  }
  static DeleteCartItemBloc deleteCartItemBloc() {
    return DeleteCartItemBloc(CartRepositoryModule.cartRepository);
  }
}