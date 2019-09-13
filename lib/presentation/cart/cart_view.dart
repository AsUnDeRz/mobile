import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/domain/model/cart_item.dart';

abstract class CartView {
  void onDeleteCartItem (CartItem cartItem);
  void onClearCart ();
  void onCartUpdated(Cart cart);
  void onError(String error);
}