import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/data/repository/cart_data_repository.dart';

class DeleteCartItemBloc extends Bloc<DeleteCartItemEvent, DeleteCartItemState> {
  final CartDataRepository  _cartDataRepository;
  int _deleteId;
  DeleteCartItemBloc(this._cartDataRepository);

  @override
  DeleteCartItemState get initialState => DeleteCartItemLoadingState();

  @override
  Stream<DeleteCartItemState> mapEventToState(DeleteCartItemEvent event) async* {
    if (event is DeleteCartItemInitEvent) {
      yield  _mapDeleteCartItemInitToState(event);
    }
    if (event is DeleteCartItemDeleteEvent) {
      yield await _mapDeleteCartItemDeleteToState(event);
    }
  }

  DeleteCartItemState _mapDeleteCartItemInitToState(DeleteCartItemInitEvent event) {
    _deleteId = event.id;
    return DeleteCartItemInitState();
  }

  Future<DeleteCartItemState> _mapDeleteCartItemDeleteToState(DeleteCartItemDeleteEvent event) async {
    try {
      await _cartDataRepository.deleteCartItem(_deleteId);
      return DeleteCartItemApplyDeleteState();
    } catch(e) {
      return DeleteCartItemErrorState(e);
    }
  }
}

@immutable
abstract class DeleteCartItemEvent {}

class DeleteCartItemInitEvent extends DeleteCartItemEvent{
  final id;
  DeleteCartItemInitEvent(this.id);
}

class DeleteCartItemDeleteEvent extends DeleteCartItemEvent{}

@immutable
abstract class DeleteCartItemState {}

class DeleteCartItemLoadingState extends DeleteCartItemState {}

class DeleteCartItemInitState extends DeleteCartItemState {}

class DeleteCartItemApplyDeleteState extends DeleteCartItemState {}

class DeleteCartItemErrorState extends DeleteCartItemState {
  final dynamic error;
  DeleteCartItemErrorState(this.error);
}