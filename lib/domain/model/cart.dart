import 'package:catalog_app/domain/model/cart_item.dart';

class Cart {
  final List<CartItem> _listItems;

  Cart(this._listItems);

  List<CartItem> get listItems => _listItems;

  double get sum {
    if(listItems.isEmpty) {
      return 0.0;
    }
    return this.listItems.fold(0.0, (value, item) => value + item.sum);
  }
}