import 'package:catalog_app/domain/model/cart.dart';

abstract class CartRepository {
  Stream<Cart> getCartStream();
  Future<void> addCartItem(double sum);
  Future<void> clearCart();
}