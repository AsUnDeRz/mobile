import 'package:catalog_app/data/db/model/db_offer.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/model/seller.dart';

class OfferMapper {

  static Offer toOffer(DbOffer dbOffer, Seller seller) {
    return Offer(
      dbOffer.id,
      dbOffer.title,
      dbOffer.image,
      dbOffer.category,
      dbOffer.price,
      dbOffer.description,
      dbOffer.characters,
      seller,
    );
  }

  static DbOffer fromOffer(Offer offer) {
    return DbOffer(
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