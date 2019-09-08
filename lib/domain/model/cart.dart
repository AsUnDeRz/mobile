import 'package:catalog_app/domain/model/cart_item.dart';

class Cart {
  List<CartItem> listItem;

  Cart(this.listItem);

  List<CartItem> get listItems => listItem;
  double get sum {
    double sum = 0;
    listItems.forEach((cartItem) => sum += cartItem.price);
    return sum;
  }
}