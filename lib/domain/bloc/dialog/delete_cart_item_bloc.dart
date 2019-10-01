import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/data/repository/cart_data_repository.dart';

class DeleteCartItemBloc extends Bloc<DeleteCartItemEvent, DeleteCartItemState> {
  final CartDataRepository  _cartDataRepository;

  DeleteCartItemBloc(this._cartDataRepository);

  @override
  DeleteCartItemState get initialState => DeleteCartItemInitState();

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
    return DeleteCartItemInitState();
  }

  Future<DeleteCartItemState> _mapDeleteCartItemDeleteToState(DeleteCartItemDeleteEvent event) async {
    try {
      await _cartDataRepository.deleteCartItem(event.id);
      return DeleteCartItemApplyDeleteState();
    } catch(e) {
      return DeleteCartItemErrorState(e);
    }
  }
}

@immutable
abstract class DeleteCartItemEvent {}

class DeleteCartItemInitEvent extends DeleteCartItemEvent{}

class DeleteCartItemDeleteEvent extends DeleteCartItemEvent{
  final id;
  DeleteCartItemDeleteEvent(this.id);
}

@immutable
abstract class DeleteCartItemState {}

class DeleteCartItemInitState extends DeleteCartItemState {}

class DeleteCartItemApplyDeleteState extends DeleteCartItemState {}

class DeleteCartItemErrorState extends DeleteCartItemState {
  final dynamic error;
  DeleteCartItemErrorState(this.error);
}