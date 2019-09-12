import 'package:catalog_app/domain/model/seller.dart';
import 'package:catalog_app/domain/repository/seller_repository.dart';

class GetSellerByIdCase {
  final SellerRepository _sellerRepository;

  GetSellerByIdCase(this._sellerRepository);

  Future<Seller> getSellerById(int id) {
    return _sellerRepository.getSellerById(id);
  }
}