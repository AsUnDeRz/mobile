import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/model/cart_item.dart';

class CountGoodBloc extends Bloc<CountGoodEvent, CountGoodState> {
  final _cartDataRepository;
  CartItem _cartItem;

  CountGoodBloc(this._cartDataRepository);

  @override
  CountGoodState get initialState => LoadingState();

  @override
  Stream<CountGoodState> mapEventToState(CountGoodEvent event) async* {
    if (event is InitEvent) {
      yield  _mapInitToState(event);
    }
    if (event is DecrementCountEvent) {
      yield  _mapDecrementCountToState(event);
    }
    if (event is IncrementCountEvent) {
      yield  _mapIncrementCountToState(event);
    }
    if (event is AddCartEvent) {
      yield await _mapAddCartToState(event);
    }
  }

  CountGoodState _mapInitToState(InitEvent event) {
    _cartItem = event.cartItem;
    return UpdateCountState(_cartItem);
  }

  CountGoodState _mapDecrementCountToState(DecrementCountEvent event) {
    final decrementedCount = _cartItem.count - 1;
    _cartItem = _cartItem.copyWith(count: decrementedCount);
    return UpdateCountState(_cartItem);
  }

  CountGoodState _mapIncrementCountToState(IncrementCountEvent event) {
    final incrementedCount = _cartItem.count + 1;
    _cartItem = _cartItem.copyWith(count: incrementedCount);
    return UpdateCountState(_cartItem);
  }

  Future<CountGoodState> _mapAddCartToState(AddCartEvent event) async {
    try {
      await _addCartItem(_cartItem);
      return ApplyAddCartState();
    } catch(e) {
      return ErrorState(e);
    }
  }

  Future<void> _addCartItem(CartItem cartItem) async {
    final cart = await _cartDataRepository.getCartStream().first;
    final existingCartItem = cart.listItems.singleWhere(
      ((item) => item.offerId == cartItem.offerId),
      orElse: () => null,
    );

    if (existingCartItem != null) {
      final updatedCount = existingCartItem.count + cartItem.count;
      final updatedCartItem = _cartItem.copyWith(count: updatedCount);
      return _cartDataRepository.updateCartItem(updatedCartItem);
    }

    return _cartDataRepository.addCartItem(cartItem);
  }
}

@immutable
abstract class CountGoodEvent {}

class InitEvent extends CountGoodEvent{
  final CartItem cartItem;
  InitEvent(this.cartItem);
}

class DecrementCountEvent extends CountGoodEvent{}

class IncrementCountEvent extends CountGoodEvent{}

class AddCartEvent extends CountGoodEvent{}

@immutable
abstract class CountGoodState {}

class LoadingState extends CountGoodState {}

class ApplyAddCartState extends CountGoodState {}

class UpdateCountState extends CountGoodState{
  final cartItem;
  UpdateCountState(this.cartItem);
}

class ErrorState extends CountGoodState {
  final dynamic error;
  ErrorState(this.error);
}