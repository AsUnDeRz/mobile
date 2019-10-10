import 'package:catalog_app_bloc/domain/model/offer.dart';

abstract class OfferRepository {
  Future<List<Offer>> getListOffer();
}