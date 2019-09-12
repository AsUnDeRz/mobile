import 'package:catalog_app/data/repository/seller_data_repository.dart';
import 'package:catalog_app/internal/dependencies/db_module.dart';


class SellerRepositoryModule {
  static final sellerRepository = SellerDataRepository(DbModule.dbUtil);
}