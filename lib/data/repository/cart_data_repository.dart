import 'package:rxdart/rxdart.dart';

import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/domain/repository/cart_repository.dart';


class CartDataRepository extends CartRepository {
  static Cart _cart;

  final _cartSubject = BehaviorSubject <Cart> ();

  CartDataRepository() {
    _cart = Cart(0.0);
    _cartUpdate();
  }

  Future<void> _cartUpdate() async {
    _cartSubject.add(_cart);
  }

  @override
  Future<void> addCartItem(double sum) async {
    _cart = Cart(_cart.sum + sum);
    await _cartUpdate();
  }

  @override
  Future<void> clearCart() async {
    _cart = Cart(0.0);
    await _cartUpdate();
  }

  @override
  Stream<Cart> getCartStream() {
    return _cartSubject.stream;
  }
}