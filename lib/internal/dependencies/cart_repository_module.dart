import 'package:catalog_app/data/repository/cart_data_repository.dart';

import 'db_module.dart';

class CartRepositoryModule {
  static final cartRepository = CartDataRepository(DbModule.dbUtil());
}