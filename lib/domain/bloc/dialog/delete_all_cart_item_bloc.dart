import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/data/repository/cart_data_repository.dart';

class DeleteAllCartItemsBloc extends Bloc<DeleteAllCartItemsEvent, DeleteAllCartItemsState> {
  final CartDataRepository _cartDataRepository;

  DeleteAllCartItemsBloc(this._cartDataRepository);

  @override
  DeleteAllCartItemsState get initialState => InitState();

  @override
  Stream<DeleteAllCartItemsState> mapEventToState(DeleteAllCartItemsEvent event) async* {
    if (event is InitEvent) {
      yield  _mapInitToState(event);
    }
    if (event is ClearEvent) {
      yield await _mapClearToState(event);
    }
  }

  DeleteAllCartItemsState _mapInitToState(InitEvent event) {
    return InitState();
  }

  Future<DeleteAllCartItemsState> _mapClearToState(ClearEvent event) async {
    try {
      await _cartDataRepository.clearCart();
      return ApplyClearState();
    } catch(e) {
      return ErrorState(e);
    }
  }
}

@immutable
abstract class DeleteAllCartItemsEvent {}

class InitEvent extends DeleteAllCartItemsEvent{}

class ClearEvent extends DeleteAllCartItemsEvent{}

@immutable
abstract class DeleteAllCartItemsState {}

class InitState extends DeleteAllCartItemsState {}

class ApplyClearState extends DeleteAllCartItemsState {}

class ErrorState extends DeleteAllCartItemsState {
  final dynamic error;
  ErrorState(this.error);
}