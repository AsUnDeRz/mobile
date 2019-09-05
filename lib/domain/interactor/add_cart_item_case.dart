import 'package:catalog_app/domain/repository/cart_repository.dart';

class AddCartItemCase {
  final CartRepository _cartRepository;

  AddCartItemCase(this._cartRepository);

  Future<void> addCartItem(double sum) async {
    return _cartRepository.addCartItem(sum);
  }
}