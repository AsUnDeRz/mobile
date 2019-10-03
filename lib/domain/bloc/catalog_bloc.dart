import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/data/repository/offer_data_repository.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  OfferDataRepository _offerDataRepository;

  CatalogBloc(this._offerDataRepository);

  @override
  CatalogState get initialState => LoadingState();

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {

    if (event is RefreshEvent) {
      yield await _mapRefreshToState(event);
    }
  }

  Future<CatalogState> _mapRefreshToState(RefreshEvent event) async {
    try {
      final listOffers = await _offerDataRepository.getListOffer();
      return ReadyState(listOffers);
    } catch(e) {
      return ErrorState(e);
    }
  }
}

@immutable
abstract class CatalogEvent {}

class RefreshEvent extends CatalogEvent{}

@immutable
abstract class CatalogState {}

class LoadingState extends CatalogState {}

class ReadyState extends CatalogState {
  final listOffers;
  ReadyState(this.listOffers);
}

class ErrorState extends CatalogState {
  final dynamic error;

  ErrorState(this.error);
}