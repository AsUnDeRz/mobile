import 'package:catalog_app_bloc/data/db/db_util.dart';
import 'package:catalog_app_bloc/data/db/orm/orm_cart_item.dart';
import 'package:catalog_app_bloc/data/db/orm/orm_offer.dart';

class DbModule {
  static DbUtil _dbUtilInstance;
  static OrmOffer _ormOffer;
  static OrmCartItem _ormCartItem;

  static OrmOffer ormOffer() {
    if (_ormOffer == null) {
      _ormOffer = OrmOffer(_dbUtil());
    }
    return _ormOffer;
  }

  static OrmCartItem ormCartItem() {
    if (_ormCartItem == null) {
      _ormCartItem = OrmCartItem(_dbUtil());
    }
    return _ormCartItem;
  }

  static DbUtil _dbUtil() {
    if (_dbUtilInstance == null) {
      _dbUtilInstance = DbUtil();
    }
    return _dbUtilInstance;
  }
}