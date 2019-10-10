import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/data/repository/cart_data_repository.dart';

class DeleteCartItemBloc extends Bloc<DeleteCartItemEvent, DeleteCartItemState> {
  final CartDataRepository  _cartDataRepository;
  int _deleteId;
  DeleteCartItemBloc(this._cartDataRepository);

  @override
  DeleteCartItemState get initialState => LoadingState();

  @override
  Stream<DeleteCartItemState> mapEventToState(DeleteCartItemEvent event) async* {
    if (event is InitEvent) {
      yield  _mapInitToState(event);
    }
    if (event is DeleteEvent) {
      yield await _mapDeleteToState(event);
    }
  }

  DeleteCartItemState _mapInitToState(InitEvent event) {
    _deleteId = event.id;
    return InitState();
  }

  Future<DeleteCartItemState> _mapDeleteToState(DeleteEvent event) async {
    try {
      await _cartDataRepository.deleteCartItem(_deleteId);
      return ApplyDeleteState();
    } catch(e) {
      return ErrorState(e);
    }
  }
}

@immutable
abstract class DeleteCartItemEvent {}

class InitEvent extends DeleteCartItemEvent{
  final id;
  InitEvent(this.id);
}

class DeleteEvent extends DeleteCartItemEvent{}

@immutable
abstract class DeleteCartItemState {}

class LoadingState extends DeleteCartItemState {}

class InitState extends DeleteCartItemState {}

class ApplyDeleteState extends DeleteCartItemState {}

class ErrorState extends DeleteCartItemState {
  final dynamic error;
  ErrorState(this.error);
}