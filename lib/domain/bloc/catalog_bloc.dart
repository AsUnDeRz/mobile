import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/data/repository/offer_data_repository.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  OfferDataRepository _offerDataRepository;

  CatalogBloc(this._offerDataRepository);

  @override
  CatalogState get initialState => CatalogLoadingState();

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {

    if (event is CatalogRefreshEvent) {
      yield await _mapCatalogRefreshToState(event);
    }
  }

  Future<CatalogState> _mapCatalogRefreshToState(CatalogRefreshEvent event) async {
    try {
      final listOffers = await _offerDataRepository.getListOffer();
      return CatalogReadyState(listOffers);
    } catch(e) {
      return CatalogErrorState(e);
    }
  }
}

@immutable
abstract class CatalogEvent {}

class CatalogRefreshEvent extends CatalogEvent{}

@immutable
abstract class CatalogState {}

class CatalogLoadingState extends CatalogState {}

class CatalogReadyState extends CatalogState {
  final listOffers;
  CatalogReadyState(this.listOffers);
}

class CatalogErrorState extends CatalogState {
  final dynamic error;

  CatalogErrorState(this.error);
}