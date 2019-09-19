import 'package:catalog_app/data/db/db_util.dart';
import 'package:catalog_app/data/db/orm/orm_offer.dart';

class DbModule {
  static DbUtil _dbUtil;
  static OrmOffer _ormOffer;

  static OrmOffer ormOffer() {
    if (_ormOffer == null) {
      _ormOffer = OrmOffer(dbUtil());
    }
    return _ormOffer;
  }

  static DbUtil dbUtil() {
    if (_dbUtil == null) {
      _dbUtil = DbUtil();
    }
    return _dbUtil;
  }
}