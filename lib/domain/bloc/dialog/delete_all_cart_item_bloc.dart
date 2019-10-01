import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/data/repository/cart_data_repository.dart';

class DeleteAllCartItemsBloc extends Bloc<DeleteAllCartItemsEvent, DeleteAllCartItemsState> {
  final CartDataRepository _cartDataRepository;

  DeleteAllCartItemsBloc(this._cartDataRepository);

  @override
  DeleteAllCartItemsState get initialState => DeleteAllCartItemsInitState();

  @override
  Stream<DeleteAllCartItemsState> mapEventToState(DeleteAllCartItemsEvent event) async* {
    if (event is DeleteAllCartItemsInitEvent) {
      yield  _mapDeleteAllCartItemsInitToState(event);
    }
    if (event is DeleteAllCartItemsClearEvent) {
      yield await _mapDeleteAllCartItemsClearToState(event);
    }
  }

  DeleteAllCartItemsState _mapDeleteAllCartItemsInitToState(DeleteAllCartItemsInitEvent event) {
    return DeleteAllCartItemsInitState();
  }

  Future<DeleteAllCartItemsState> _mapDeleteAllCartItemsClearToState(DeleteAllCartItemsClearEvent event) async {
    try {
      await _cartDataRepository.clearCart();
      return DeleteAllCartItemsApplyClearState();
    } catch(e) {
      return DeleteAllCartItemsErrorState(e);
    }
  }
}

@immutable
abstract class DeleteAllCartItemsEvent {}

class DeleteAllCartItemsInitEvent extends DeleteAllCartItemsEvent{}

class DeleteAllCartItemsClearEvent extends DeleteAllCartItemsEvent{}

@immutable
abstract class DeleteAllCartItemsState {}

class DeleteAllCartItemsInitState extends DeleteAllCartItemsState {}

class DeleteAllCartItemsApplyClearState extends DeleteAllCartItemsState {}

class DeleteAllCartItemsErrorState extends DeleteAllCartItemsState {
  final dynamic error;
  DeleteAllCartItemsErrorState(this.error);
}