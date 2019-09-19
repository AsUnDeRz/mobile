import 'package:rxdart/rxdart.dart';

import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/repository/cart_repository.dart';

import 'package:catalog_app/data/db/db_util.dart';

class CartDataRepository extends CartRepository {
  final _cartSubject = BehaviorSubject <Cart> ();
  final DbUtil _dbUtil;

  CartDataRepository(this._dbUtil) {
    _cartUpdate();
  }

  @override
  Future<void> addCartItem(CartItem item) async {
    _dbUtil.insert(CartScheme.tableId, item.toMap());
    await _cartUpdate();
  }

  @override
  Future<void> clearCart() async {
    _dbUtil.delete(CartScheme.tableId);
    await _cartUpdate();
  }

  @override
  Stream<Cart> getCartStream() {
    return _cartSubject.stream;
  }

  Future<void> _cartUpdate() async {
    final cartItems = await _getCartItems();
    final cart = Cart(cartItems);
    _cartSubject.add(cart);
  }

  Future<List<CartItem>> _getCartItems() async {
    final maps = await _dbUtil.get(
      CartScheme.tableId,
    );

    return maps
        .map((map) => CartItem.fromMap(map))
        .toList(growable: false);
  }

  @override
  Future<void> updateCartItem(CartItem cartItem) async {
    await _dbUtil.update(
        CartScheme.tableId,
        cartItem.toMap(),
        where: '${CartScheme.columnId} = ?',
        whereArgs: [cartItem.id]
    );

    await _cartUpdate();
  }

  @override
  Future<void> deleteCartItem(int id) async {
    await _dbUtil.delete(CartScheme.tableId,
        where: '${CartScheme.columnId} = ?',
        whereArgs: [id],
    );
    await _cartUpdate();
  }
}