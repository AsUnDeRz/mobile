import 'dart:math';

import 'package:catalog_app/data/api/api_util.dart';
import 'package:catalog_app/data/db/mapping/offer_mapper.dart';
import 'package:catalog_app/data/db/model/offerDb.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/domain/model/seller.dart';
import 'package:catalog_app/domain/repository/offer_repository.dart';
import 'package:catalog_app/data/db/db_util.dart';
import 'package:catalog_app/data/db/db_demo.dart';
import 'package:catalog_app/internal/dependencies/application_component.dart';

class OfferDataRepository extends OfferRepository  {

  DbUtil _dbUtil;
  ApiUtil _apiUtil;

  OfferDataRepository (this._dbUtil):
  _apiUtil=ApiModule.apiUtil();

  @override
  Future<List<Offer>> getListOffer() async {
    if (randomError) return Future.error('Не сегодня.... Попробуйте завтра.');

    List<Map<String, dynamic>> offerDbMaps = await _dbUtil.get(OfferScheme.tableId,);

    if (_checkCache(offerDbMaps)) await _cache();

    offerDbMaps = await _dbUtil.get(OfferScheme.tableId,);
    offerDbMaps = await _getSellersOfOffers(offerDbMaps);

    return offerDbMaps
        .map((offerDbMap) => OfferDb.fromMap(offerDbMap))
        .map((offerDb) => OfferMapper.toOffer(offerDb))
        .toList(growable: false);
  }

  bool _checkCache(List<Map<String, dynamic>> maps){
    return maps.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> _getSellersOfOffers(dynamic maps) async {
    List <Map<String, dynamic>> offers=[];
    for(int i=0; i!=maps.length; ++i) {
      final seller = await getSellerById(maps[i][OfferDb.OFFER_SELLER_ID]);
      offers.add({
        OfferDb.OFFER_SELLER: {...seller},
        ...maps[i],
      });
    }

    return offers;
  }

  @override
  Future<Map<String, dynamic>> getSellerById(int id) async {
    final map = await _dbUtil.get(
      SellerScheme.tableId,
      where: '${Seller.SELLER_ID} = ?',
      whereArgs: [id],
    );

    return map.first;
  }

  Future<void> _cache() async{
    final offers = await synchronizedOffer;

    final offersDb = offers
        .map((offer) => OfferMapper.fromOffer(offer))
        .toList(growable: false);

    offersDb.forEach( (offerDb) async {
      await _dbUtil.insert(OfferScheme.tableId, offerDb.toMap());
    });
  }

  Future<List<Offer>> get synchronizedOffer async {
    final titles = await synchronizedTitleOffer;
    final descriptions = await synchronizedDescriptionOffer;

    List<Offer> offers = [];

    for (int i = 0; i != OfferFixture.countGoods; ++i) {
      offers.add(Offer(
        null,
        titles[i],
        OfferFixture.image,
        OfferFixture.category,
        OfferFixture.price,
        descriptions[i],
        OfferFixture.characters,
        Seller.fromMap(getSellerById(SellerFixture.sellerId)),
      ));
    }
    return offers;
  }

  get synchronizedTitleOffer async {
    final titles = await _apiUtil.getEngFixtureTitle(OfferFixture.countGoods);
    return titles;
  }

  get synchronizedDescriptionOffer async {
    final descriptions = await _apiUtil.getEngFixtureDescription(OfferFixture.countGoods);
    return descriptions;
  }

  bool get randomError => Random().nextBool();
}