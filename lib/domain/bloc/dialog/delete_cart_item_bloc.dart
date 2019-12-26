import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/data/repository/cart_data_repository.dart';

class DeleteCartItemBloc extends Bloc<DeleteCartItemEvent, DeleteCartItemState> {
  final CartDataRepository  _cartDataRepository;
  int _deleteId;
  DeleteCartItemBloc(this._cartDataRepository);

  @override
  DeleteCartItemState get initialState => LoadingDeleteCartItemState();

  @override
  Stream<DeleteCartItemState> mapEventToState(DeleteCartItemEvent event) async* {
    if (event is InitDeleteCartItemEvent) {
      yield  _mapInitToState(event);
    }
    if (event is DeleteDeleteCartItemEvent) {
      yield await _mapDeleteToState(event);
    }
  }

  DeleteCartItemState _mapInitToState(InitDeleteCartItemEvent event) {
    _deleteId = event.id;
    return InitDeleteCartItemState();
  }

  Future<DeleteCartItemState> _mapDeleteToState(DeleteDeleteCartItemEvent event) async {
    try {
      await _cartDataRepository.deleteCartItem(_deleteId);
      return ApplyDeleteDeleteCartItemState();
    } catch(e) {
      return ErrorDeleteCartItemState(e);
    }
  }
}

@immutable
abstract class DeleteCartItemEvent {}

class InitDeleteCartItemEvent extends DeleteCartItemEvent{
  final id;
  InitDeleteCartItemEvent(this.id);
}

class DeleteDeleteCartItemEvent extends DeleteCartItemEvent{}

@immutable
abstract class DeleteCartItemState {}

class LoadingDeleteCartItemState extends DeleteCartItemState {}

class InitDeleteCartItemState extends DeleteCartItemState {}

class ApplyDeleteDeleteCartItemState extends DeleteCartItemState {}

class ErrorDeleteCartItemState extends DeleteCartItemState {
  final dynamic error;
  ErrorDeleteCartItemState(this.error);
}