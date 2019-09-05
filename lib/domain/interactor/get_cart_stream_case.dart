import 'package:catalog_app/domain/model/cart.dart';
import 'package:catalog_app/domain/repository/cart_repository.dart';

class GetCartStreamCase {
  final CartRepository _cartRepository;

  GetCartStreamCase(this._cartRepository);

  Stream<Cart> getCartStream() {
    return _cartRepository.getCartStream();
  }
}