import 'package:catalog_app/data/sp/sp_util.dart';

class SpModule {

  static SpUtil _spUtil;

  static SpUtil spUtil() {
    if (_spUtil == null) {
      _spUtil = SpUtil();
    }
    return _spUtil;
  }
}