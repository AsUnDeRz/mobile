import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/repository/offer_repository.dart';

class OfferDataRepository extends OfferRepository {

  @override
  Future<List<Offer>> getListOffer() async {
    return [
      Offer(
        'Good 3',
        'assets/images/good3.jpg',
        'category 3',
      ),
      Offer(
        'Good 2',
        'assets/images/good2.jpg',
        'category 2',
      ),
      Offer(
        'Good 1',
        'assets/images/good1.jpg',
        'category 1',
      ),
      Offer(
        'Good 3',
        'assets/images/good3.jpg',
        'category 3',
      ),
      Offer(
        'Good 2',
        'assets/images/good2.jpg',
        'category 2',
      ),
      Offer(
        'Good 1',
        'assets/images/good1.jpg',
        'category 1',
      ),
    ];
  }
}