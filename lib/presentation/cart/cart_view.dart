import 'package:catalog_app/domain/model/cart_item.dart';

abstract class CartView {
  void onReceivedCartItems(List<CartItem> listItems);
  void onLogoutSuccess ();
  void onError(String error);
}