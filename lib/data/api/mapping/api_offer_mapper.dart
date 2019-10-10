import 'package:catalog_app_bloc/data/api/model/api_offer.dart';
import 'package:catalog_app_bloc/domain/model/offer.dart';

class ApiOfferMapper {
  static Offer toOffer(ApiOffer apiOffer) {
    return Offer(
      apiOffer.id,
      apiOffer.title,
      apiOffer.image,
      apiOffer.gallery,
      apiOffer.category,
      apiOffer.price,
      apiOffer.description,
      apiOffer.characters,
      apiOffer.seller
    );
  }
}