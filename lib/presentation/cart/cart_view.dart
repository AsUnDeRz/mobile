import 'package:catalog_app/domain/model/cart.dart';

abstract class CartView {
  void onCartUpdated(Cart cart);
  void onError(String error);
}