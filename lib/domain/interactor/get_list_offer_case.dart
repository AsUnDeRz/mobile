import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/repository/offer_repository.dart';

class GetListOfferCase {
  final OfferRepository _offerRepository;

  GetListOfferCase(this._offerRepository);

  Future<List<Offer>> getListOffer() {
    return  _offerRepository.getListOffer();
  }
}