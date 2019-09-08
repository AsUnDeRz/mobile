import 'package:catalog_app/domain/repository/cart_repository.dart';
import 'package:catalog_app/domain/model/cart_item.dart';

class GetCartItemsCase {
  final CartRepository _cartRepository;

  GetCartItemsCase(this._cartRepository);

  Future<List<CartItem>> getCartItems() {
    return _cartRepository.getCartItems();
  }
}