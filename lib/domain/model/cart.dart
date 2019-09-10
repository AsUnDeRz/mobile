import 'package:catalog_app/domain/model/cart_item.dart';

class Cart {
  final List<CartItem> _listItem;

  Cart(this._listItem);

  List<CartItem> get listItems => _listItem;

  double get sum {
    return listItems.fold(0.0, (value, cartItem) => value + cartItem.price);
  }
}