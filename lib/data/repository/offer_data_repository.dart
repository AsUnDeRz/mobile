import 'dart:math';

import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/repository/offer_repository.dart';
import 'package:catalog_app/data/db/db_util.dart';
import 'package:catalog_app/data/db/db_demo.dart';

class OfferDataRepository extends OfferRepository {

  DbUtil _dbUtil;

  OfferDataRepository (this._dbUtil);

  @override
  Future<List<Offer>> getListOffer() async {
    var randInt=Random();
    if(randInt.nextBool() == true) {
      return Future.error('Не сегодня.... Попробуйте завтра.');
    } else {
      final maps = await _dbUtil.get(OfferScheme.tableId,);
      if(maps.length > 0) {
        return maps
            .map((map) => Offer.fromMap(map))
            .toList(growable: false);
      } else {
        await _cache();
        final repeatedMaps = await _dbUtil.get(OfferScheme.tableId,);
        return repeatedMaps.map((map) => Offer.fromMap(map))
            .toList(growable: false);
      }
    }
  }

  Future<void> _cache() async{
    List<Offer> offers = await OfferFixture.synchronizedOffer;
    offers.forEach( (offer) async => await _dbUtil.insert(OfferScheme.tableId, offer.toMap())) ;
    }
  }