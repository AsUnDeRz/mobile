import 'package:catalog_app_bloc/data/db/model/db_cart_item.dart';
import 'package:catalog_app_bloc/domain/model/cart_item.dart';

class CartItemMapper {
  static CartItem toCartItem(DbCartItem dbCartItem) {
    return CartItem(
      dbCartItem.id,
      dbCartItem.title,
      dbCartItem.image,
      dbCartItem.offerId,
      dbCartItem.count,
      dbCartItem.price,
    );
  }

  static DbCartItem fromCartItem(CartItem cartItem) {
    return DbCartItem(
      cartItem.id,
      cartItem.title,
      cartItem.image,
      cartItem.offerId,
      cartItem.count,
      cartItem.price,
    );
  }
}