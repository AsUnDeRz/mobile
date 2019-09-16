import 'package:catalog_app/domain/model/seller.dart';
import 'package:catalog_app/domain/repository/seller_repository.dart';
import 'package:catalog_app/data/db/db_util.dart';

class SellerDataRepository extends SellerRepository {

  DbUtil _dbUtil;

  SellerDataRepository (this._dbUtil);

  @override
  Future<Seller> getSellerById(int id) async {
    final map = await _dbUtil.get(
      SellerScheme.tableId,
      where: '${Seller.ID} = ?',
      whereArgs: [id],
    );

    return Seller.fromMap(map.first);
  }
}