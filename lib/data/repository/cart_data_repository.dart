import 'package:rxdart/rxdart.dart';

import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/repository/cart_repository.dart';


class CartDataRepository extends CartRepository {
  static Cart _cart;

  final _cartSubject = BehaviorSubject <Cart> ();

  CartDataRepository() {
    _cart = Cart(List<CartItem>());
    _cartUpdate();
  }

  Future<void> _cartUpdate() async {
    _cartSubject.add(_cart);
  }

  @override
  Future<void> addCartItem(CartItem item) async {
    List<CartItem> newListItem=_cart.listItem;
    newListItem.add(item);
    _cart= Cart(newListItem);
    await _cartUpdate();
  }

  @override
  Future<void> clearCart() async {
    _cart = Cart(List<CartItem>());
    await _cartUpdate();
  }

  @override
  Stream<Cart> getCartStream() {
    return _cartSubject.stream;
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    return _cart.listItem;
  }
}