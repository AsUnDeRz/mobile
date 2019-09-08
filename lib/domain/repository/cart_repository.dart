import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/domain/model/cart_item.dart';

abstract class CartRepository {
  Stream<Cart> getCartStream();
  Future<List<CartItem>> getCartItems();
  Future<void> addCartItem(CartItem item);
  Future<void> clearCart();
}