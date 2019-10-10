import 'package:sqflite/sqflite.dart';

import 'package:catalog_app_bloc/data/db/db_scheme.dart';
import 'package:catalog_app_bloc/data/db/db_util.dart';
import 'package:catalog_app_bloc/data/db/mapping/offer_mapper.dart';
import 'package:catalog_app_bloc/data/db/mapping/seller_mapper.dart';
import 'package:catalog_app_bloc/data/db/model/db_offer.dart';
import 'package:catalog_app_bloc/data/db/model/db_seller.dart';
import 'package:catalog_app_bloc/domain/model/offer.dart';
import 'package:catalog_app_bloc/domain/model/seller.dart';

class OrmOffer {
  DbUtil _dbUtil;

  OrmOffer(this._dbUtil);

  Future<List<Offer>> getListOffer() async {
    final maps = await _dbUtil.get(OfferScheme.tableId,);
    final dbOffers = maps
        .map((dbOffer) => DbOffer.fromMap(dbOffer))
        .toList(growable: false);

    List<Offer> offers = [];

    for(DbOffer dbOffer in dbOffers){
      Seller seller = await _getSellerById(dbOffer.sellerId);
      offers.add(OfferMapper.toOffer(dbOffer, seller));
    }

    return offers;
  }

  Future<Seller> _getSellerById(int id) async {
    final map = await _dbUtil.get(
      SellerScheme.tableId,
      where: '${DbSeller.ID} = ?',
      whereArgs: [id],
    );
    final dbSeller = DbSeller.fromMap(map.first);
    return SellerMapper.toSeller(dbSeller);
  }

  Future<void> saveListOffer(List<Offer> listOffer) async {
    for (final offer in listOffer){
      await _dbUtil.insert(
        SellerScheme.tableId,
        SellerMapper.fromSeller(offer.seller).toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      await _dbUtil.insert(
        OfferScheme.tableId,
        OfferMapper.fromOffer(offer).toMap(),
      );
    }
  }
}