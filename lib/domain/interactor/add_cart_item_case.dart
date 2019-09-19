import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/repository/cart_repository.dart';

class AddCartItemCase {
  final CartRepository _cartRepository;

  AddCartItemCase(this._cartRepository);

  Future<void> addCartItem(CartItem cartItem) async {
    final cart = await _cartRepository.getCartStream().first;
    final existingCartItem = cart.listItems.singleWhere(
      ((item) => item.offerId == cartItem.offerId),
      orElse: () => null,
    );
    if (existingCartItem != null) {
      final updatedCartItem=CartItem(
          existingCartItem.id,
          existingCartItem.title,
          existingCartItem.image,
          existingCartItem.offerId,
          existingCartItem.count + cartItem.count,
          existingCartItem.price + cartItem.price);

      return _cartRepository.updateCartItem(updatedCartItem);
    } else {
      return _cartRepository.addCartItem(cartItem);
    }
  }
}