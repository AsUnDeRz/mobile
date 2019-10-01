import 'package:catalog_app/data/db/mapping/cart_item_mapper.dart';
import 'package:catalog_app/data/db/model/db_cart_item.dart';
import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/data/db/db_util.dart';

class OrmCartItem {

  final DbUtil _dbUtil;

  OrmCartItem (this._dbUtil,);

  Future<void> insertCartItem(CartItem cartItem) async {
    _dbUtil.insert(
      CartScheme.tableId,
      CartItemMapper.fromCartItem(cartItem).toMap(),
    );
  }

  Future<void> clearCart() async {
    _dbUtil.delete(CartScheme.tableId);
  }

  Future<void> updateCartItem(CartItem cartItem) async {
    _dbUtil.update(
      CartScheme.tableId,
      CartItemMapper.fromCartItem(cartItem).toMap(),
      where: '${CartScheme.columnId} = ?',
      whereArgs: [cartItem.id],
    );
  }

  Future<void> deleteCartItem(int id) async {
    _dbUtil.delete(
      CartScheme.tableId,
      where: '${CartScheme.columnId} = ?',
      whereArgs: [id],
    );
  }

  Future<List<CartItem>> getCartItems() async {
    final maps = await _dbUtil.get(CartScheme.tableId,);

    return maps
        .map((map) => CartItemMapper.toCartItem(DbCartItem.fromMap(map)))
        .toList(growable: false);
  }
}