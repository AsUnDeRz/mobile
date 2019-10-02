import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/model/cart_item.dart';

class CountGoodBloc extends Bloc<CountGoodEvent, CountGoodState> {
  final _cartDataRepository;
  CartItem _cartItem;

  CountGoodBloc(this._cartDataRepository);

  @override
  CountGoodState get initialState => CountGoodLoadingState();

  @override
  Stream<CountGoodState> mapEventToState(CountGoodEvent event) async* {
    if (event is CountGoodInitEvent) {
      yield  _mapCountGoodInitToState(event);
    }
    if (event is CountGoodDecrementCountEvent) {
      yield  _mapCountGoodDecrementCountToState(event);
    }
    if (event is CountGoodIncrementCountEvent) {
      yield  _mapCountGoodIncrementCountToState(event);
    }
    if (event is CountGoodAddCartEvent) {
      yield await _mapCountGoodAddCartToState(event);
    }
  }

  CountGoodState _mapCountGoodInitToState(CountGoodInitEvent event) {
    _cartItem = event.cartItem;
    return CountGoodUpdateCountState(_cartItem);
  }

  CountGoodState _mapCountGoodDecrementCountToState(CountGoodDecrementCountEvent event) {
    final decrementedCount = _cartItem.count - 1;
    _cartItem = CartItem.fromCartItem(_cartItem, count: decrementedCount);
    return CountGoodUpdateCountState(_cartItem);
  }

  CountGoodState _mapCountGoodIncrementCountToState(CountGoodIncrementCountEvent event) {
    final incrementedCount = _cartItem.count + 1;
    _cartItem = CartItem.fromCartItem(_cartItem, count: incrementedCount);
    return CountGoodUpdateCountState(_cartItem);
  }

  Future<CountGoodState> _mapCountGoodAddCartToState(CountGoodAddCartEvent event) async {
    try {
      await _addCartItem(_cartItem);
      return CountGoodApplyAddCartState();
    } catch(e) {
      return CountGoodErrorState(e);
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
      final updatedCartItem = CartItem.fromCartItem(existingCartItem, count: updatedCount);
      return _cartDataRepository.updateCartItem(updatedCartItem);
    }

    return _cartDataRepository.addCartItem(cartItem);
  }
}

@immutable
abstract class CountGoodEvent {}

class CountGoodInitEvent extends CountGoodEvent{
  final CartItem cartItem;
  CountGoodInitEvent(this.cartItem);
}

class CountGoodDecrementCountEvent extends CountGoodEvent{}

class CountGoodIncrementCountEvent extends CountGoodEvent{}

class CountGoodAddCartEvent extends CountGoodEvent{}

@immutable
abstract class CountGoodState {}

class CountGoodLoadingState extends CountGoodState {}

class CountGoodApplyAddCartState extends CountGoodState {}

class CountGoodUpdateCountState extends CountGoodState{
  final cartItem;
  CountGoodUpdateCountState(this.cartItem);
}

class CountGoodErrorState extends CountGoodState {
  final dynamic error;
  CountGoodErrorState(this.error);
}