import 'package:rxdart/rxdart.dart';

import 'package:catalog_app/data/db/orm/orm_cart_item.dart';
import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/repository/cart_repository.dart';


class CartDataRepository extends CartRepository {
  final OrmCartItem _ormCartItem;
  final _cartSubject = BehaviorSubject <Cart> ();

  CartDataRepository(this._ormCartItem) {
    _cartUpdate();
  }

  @override
  Future<void> addCartItem(CartItem cartItem) async {
    await _ormCartItem.insertCartItem(cartItem);
    await _cartUpdate();
  }

  @override
  Future<void> clearCart() async {
    await _ormCartItem.clearCart();
    await _cartUpdate();
  }

  @override
  Stream<Cart> getCartStream() {
    return _cartSubject.stream;
  }

  @override
  Future<void> updateCartItem(CartItem cartItem) async {
    await _ormCartItem.updateCartItem(cartItem);
    await _cartUpdate();
  }

  @override
  Future<void> deleteCartItem(int id) async {
    await _ormCartItem.deleteCartItem(id);
    await _cartUpdate();
  }

  Future<void> _cartUpdate() async {
    final cartItems = await _ormCartItem.getCartItems();
    final cart = Cart(cartItems);
    _cartSubject.add(cart);
  }
}