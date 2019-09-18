import 'package:catalog_app/domain/model/offer.dart';

abstract class OfferRepository {
  Future<List<Offer>> getListOffer();
  Future <Map<String, dynamic>> getSellerById(int id);
}