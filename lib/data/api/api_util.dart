import 'dart:math';

import 'package:catalog_app_bloc/data/api/mapping/api_offer_mapper.dart';
import 'package:catalog_app_bloc/data/api/services/demo7592015.mockable.io/mockable_api_service.dart';
import 'package:catalog_app_bloc/data/api/services/fish-text.ru/fish_api_service.dart';
import 'package:catalog_app_bloc/data/api/services/loremapi.org/lorem_api_service.dart';
import 'package:catalog_app_bloc/domain/model/offer.dart';

class ApiUtil {
  final FishApiService _fishApiService;
  final LoremApiService _loremApiService;
  final MockableApiService _mockableApiService;

  ApiUtil(this._fishApiService, this._loremApiService, this._mockableApiService);

  Future<List<String>> getTitle(int count) async {
    if(Random().nextBool())
      return _loremApiService.getEngFixtureTitle(count);

    return _fishApiService.getFixtureTitle(count);
  }

  Future<List<String>> getDescription(int count) async {
    if(Random().nextBool())
      return _loremApiService.getEngFixtureDescription(count);

    return _fishApiService.getFixtureDescription(count);
  }

  Future<List<Offer>> getListOffer () async {
    final apiOffers= await _mockableApiService.getListOffer();

    return apiOffers
        .map((apiOffer) => ApiOfferMapper.toOffer(apiOffer))
        .toList(growable: false);
  }
}