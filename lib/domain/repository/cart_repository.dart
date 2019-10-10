import 'dart:core';

import 'package:catalog_app_bloc/domain/model/cart.dart';
import 'package:catalog_app_bloc/domain/model/cart_item.dart';

abstract class CartRepository {
  Stream<Cart> getCartStream();
  Future<void> addCartItem(CartItem item);
  Future<void> deleteCartItem(int id);
  Future<void> updateCartItem(CartItem cartItem);
  Future<void> clearCart();
}