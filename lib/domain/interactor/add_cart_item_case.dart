import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/domain/repository/cart_repository.dart';

class AddCartItemCase {
  final CartRepository _cartRepository;

  AddCartItemCase(this._cartRepository);

  Future<void> addCartItem(CartItem item) async {
    return _cartRepository.addCartItem(item);
  }
}