import 'package:catalog_app/domain/repository/cart_repository.dart';

class ClearCartCase {
  final CartRepository _cartRepository;

  ClearCartCase(this._cartRepository);

  Future<void> clearCart() {
    return _cartRepository.clearCart();
  }
}