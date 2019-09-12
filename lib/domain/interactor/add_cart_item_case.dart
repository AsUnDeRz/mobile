import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/repository/cart_repository.dart';

class AddCartItemCase {
  final CartRepository _cartRepository;

  AddCartItemCase(this._cartRepository);

  Future<void> addCartItem(CartItem cartItem) async {
    final cart = await _cartRepository.getCartStream().first;
    final cartItemExisting = cart.listItems.singleWhere(
      ((item) => item.offerId==cartItem.offerId),
      orElse: () => null,
    );
    if (cartItemExisting != null) {
      final updatedCartItem=CartItem(cartItemExisting.id,
          cartItemExisting.title,cartItemExisting.image,cartItemExisting.offerId,
          cartItemExisting.count+cartItem.count,
          cartItemExisting.price + cartItem.price);

      return _cartRepository.updateCartItem(updatedCartItem);
    } else {
      return _cartRepository.addCartItem(cartItem);
    }
  }
}