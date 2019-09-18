import 'package:catalog_app/domain/repository/offer_repository.dart';

class GetSellerByIdCase {
  final OfferRepository _offerRepository;

  GetSellerByIdCase(this._offerRepository);

  Future<Map<String, dynamic>> getSellerById(int id) {
    return _offerRepository.getSellerById(id);
  }
}