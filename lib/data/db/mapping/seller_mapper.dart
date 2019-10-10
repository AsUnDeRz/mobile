import 'package:catalog_app_bloc/data/db/model/db_seller.dart';
import 'package:catalog_app_bloc/domain/model/seller.dart';

class SellerMapper {
  static Seller toSeller(DbSeller dbSeller) {
    return Seller(
      dbSeller.id,
      dbSeller.name,
      dbSeller.image,
      dbSeller.type,
      dbSeller.info,
    );
  }

  static DbSeller fromSeller(Seller seller) {
    return DbSeller(
      seller.id,
      seller.name,
      seller.image,
      seller.type,
      seller.info,
    );
  }
}