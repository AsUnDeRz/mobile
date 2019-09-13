import 'package:catalog_app/domain/repository/cart_repository.dart';

class DeleteCartItemCase {
  final CartRepository _cartRepository;

  DeleteCartItemCase(this._cartRepository);

  Future<void> deleteCartItem(int id) async {
      return _cartRepository.deleteCartItem(id);
  }
}