import 'package:catalog_app_bloc/domain/bloc/cart_action_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/cart_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/dialog/count_good_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/dialog/delete_all_cart_item_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/dialog/delete_cart_item_bloc.dart';

import 'cart_repository_module.dart';

class CartModule {
  static CartActionBloc cartActionBloc(){
    return CartActionBloc(CartRepositoryModule.cartRepository);
  }
  static CartBloc cartBloc(){
    return CartBloc(CartRepositoryModule.cartRepository);
  }
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