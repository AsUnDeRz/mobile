import 'dart:math';

import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/repository/offer_repository.dart';
import 'package:catalog_app/data/db/db_util.dart';

class OfferDataRepository extends OfferRepository {

  DbUtil _dbUtil;

  OfferDataRepository (this._dbUtil);

  @override
  Future<List<Offer>> getListOffer() async {
    var randInt=Random();
    if(randInt.nextBool()==true) {
      return Future.error('Не сегодня.... Попробуйте завтра.');
    } else {
      final maps = await _dbUtil.get(
        OfferScheme.tableId,
        columns: [
          OfferScheme.columnTitle,
          OfferScheme.columnImage,
          OfferScheme.columnPrice,
        ],
      );

      return maps
          .map((map) => Offer.fromMap(map))
          .toList(growable: false);
    }
  }
}