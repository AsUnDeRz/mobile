import 'dart:math';

import 'package:catalog_app/data/api/api_util.dart';

import 'package:catalog_app/data/db/orm/orm_offer.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/repository/offer_repository.dart';

class OfferDataRepository extends OfferRepository  {

  ApiUtil _apiUtil;
  OrmOffer _ormOffer;

  OfferDataRepository (this._apiUtil, this._ormOffer);

  @override
  Future<List<Offer>> getListOffer() async {
    if (_randomError) return Future.error('Не сегодня.... Попробуйте завтра.');

    List<Offer> offers = await _ormOffer.getListOffer();

    if (!_checkCache(offers)) {
      await _cache();
      offers = await _ormOffer.getListOffer();
    }

    return  offers;
  }

  bool _checkCache(List<Offer> maps) {
    return maps.isNotEmpty;
  }

  Future<void> _cache() async {
    final offers = await _apiUtil.getListOffer();
    await _ormOffer.saveListOffer(offers);
  }

  bool get _randomError => Random().nextBool();
}