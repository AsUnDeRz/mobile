import 'package:catalog_app/domain/interactor/add_cart_item_case.dart';
import 'package:catalog_app/domain/interactor/get_cart_stream_case.dart';
import 'package:catalog_app/domain/interactor/clear_cart_case.dart';

import 'cart_repository_module.dart';

class CartModule {

  static final addCartItemCase = AddCartItemCase(
      CartRepositoryModule.cartRepository
  );

  static final getCartStreamCase = GetCartStreamCase(
      CartRepositoryModule.cartRepository
  );

  static final clearCartCase = ClearCartCase(
      CartRepositoryModule.cartRepository
  );
}