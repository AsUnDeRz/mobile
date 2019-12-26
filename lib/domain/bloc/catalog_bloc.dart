import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/data/repository/offer_data_repository.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  OfferDataRepository _offerDataRepository;

  CatalogBloc(this._offerDataRepository);

  @override
  CatalogState get initialState => LoadingCatalogState();

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {

    if (event is RefreshCatalogEvent) {
      yield await _mapRefreshToState(event);
    }
  }

  Future<CatalogState> _mapRefreshToState(RefreshCatalogEvent event) async {
    try {
      final listOffers = await _offerDataRepository.getListOffer();
      return ReadyCatalogState(listOffers);
    } catch(e) {
      return ErrorCatalogState(e);
    }
  }
}

@immutable
abstract class CatalogEvent {}

class RefreshCatalogEvent extends CatalogEvent{}

@immutable
abstract class CatalogState {}

class LoadingCatalogState extends CatalogState {}

class ReadyCatalogState extends CatalogState {
  final listOffers;
  ReadyCatalogState(this.listOffers);
}

class ErrorCatalogState extends CatalogState {
  final dynamic error;

  ErrorCatalogState(this.error);
}