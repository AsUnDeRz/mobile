import 'package:catalog_app/data/db/model/offerDb.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/model/seller.dart';

class OfferMapper {

  static Offer toOffer(OfferDb offerDb, Seller seller) {
    return Offer(
      offerDb.id,
      offerDb.title,
      offerDb.image,
      offerDb.category,
      offerDb.price,
      offerDb.description,
      offerDb.characters,
      seller,
    );
  }

  static OfferDb fromOffer(Offer offer) {
    return OfferDb(
      offer.id,
      offer.title,
      offer.image,
      offer.category,
      offer.price,
      offer.description,
      offer.characters,
      offer.seller.id,
    );
  }
}