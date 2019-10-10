import 'package:catalog_app_bloc/data/db/model/db_offer.dart';
import 'package:catalog_app_bloc/domain/model/offer.dart';
import 'package:catalog_app_bloc/domain/model/seller.dart';

class OfferMapper {
  static Offer toOffer(DbOffer dbOffer, Seller seller) {
    return Offer(
      dbOffer.id,
      dbOffer.title,
      dbOffer.image,
      dbOffer.gallery,
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
      offer.gallery,
      offer.category,
      offer.price,
      offer.description,
      offer.characters,
      offer.seller.id,
    );
  }
}