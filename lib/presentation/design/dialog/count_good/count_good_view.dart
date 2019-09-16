import 'package:catalog_app/domain/model/cart_item.dart';

abstract class CountGoodView {

  void onSaveCartItem();
  void onBack();
  void onAddCart(CartItem item);
  void onIncrement();
  void onDecrement();
  void onError(String error);
}