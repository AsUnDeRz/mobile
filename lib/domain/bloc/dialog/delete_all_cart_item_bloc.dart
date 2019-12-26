import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/data/repository/cart_data_repository.dart';

class DeleteAllCartItemsBloc extends Bloc<DeleteAllCartItemsEvent, DeleteAllCartItemsState> {
  final CartDataRepository _cartDataRepository;

  DeleteAllCartItemsBloc(this._cartDataRepository);

  @override
  DeleteAllCartItemsState get initialState => InitDeleteAllCartItemsState();

  @override
  Stream<DeleteAllCartItemsState> mapEventToState(DeleteAllCartItemsEvent event) async* {
    if (event is InitDeleteAllCartItemsEvent) {
      yield  _mapInitToState(event);
    }
    if (event is ClearDeleteAllCartItemsEvent) {
      yield await _mapClearToState(event);
    }
  }

  DeleteAllCartItemsState _mapInitToState(InitDeleteAllCartItemsEvent event) {
    return InitDeleteAllCartItemsState();
  }

  Future<DeleteAllCartItemsState> _mapClearToState(ClearDeleteAllCartItemsEvent event) async {
    try {
      await _cartDataRepository.clearCart();
      return ApplyClearDeleteAllCartItemsState();
    } catch(e) {
      return ErrorDeleteAllCartItemsState(e);
    }
  }
}

@immutable
abstract class DeleteAllCartItemsEvent {}

class InitDeleteAllCartItemsEvent extends DeleteAllCartItemsEvent{}

class ClearDeleteAllCartItemsEvent extends DeleteAllCartItemsEvent{}

@immutable
abstract class DeleteAllCartItemsState {}

class InitDeleteAllCartItemsState extends DeleteAllCartItemsState {}

class ApplyClearDeleteAllCartItemsState extends DeleteAllCartItemsState {}

class ErrorDeleteAllCartItemsState extends DeleteAllCartItemsState {
  final dynamic error;
  ErrorDeleteAllCartItemsState(this.error);
}