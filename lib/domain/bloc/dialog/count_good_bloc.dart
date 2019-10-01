import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/model/cart_item.dart';

class CountGoodBloc extends Bloc<CountGoodEvent, CountGoodState> {
  final _cartDataRepository;

  CountGoodBloc(this._cartDataRepository);

  @override
  CountGoodState get initialState => CountGoodInitState();

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
    return CountGoodInitState();
  }

  CountGoodState _mapCountGoodDecrementCountToState(CountGoodDecrementCountEvent event) {
    final decrementedCount = event.cartItem.count - 1;
    final CartItem updateCartItem = CartItem (
        null,
        event.cartItem.title,
        event.cartItem.image,
        event.cartItem.offerId,
        decrementedCount,
        event.price * decrementedCount
    );

    return CountGoodUpdateCountState(updateCartItem);
  }

  CountGoodState _mapCountGoodIncrementCountToState(CountGoodIncrementCountEvent event) {
    final incrementedCount = event.cartItem.count + 1;
    final CartItem updateCartItem = CartItem (
        null,
        event.cartItem.title,
        event.cartItem.image,
        event.cartItem.offerId,
        incrementedCount,
        event.price * incrementedCount
    );

    return CountGoodUpdateCountState(updateCartItem);
  }

  Future<CountGoodState> _mapCountGoodAddCartToState(CountGoodAddCartEvent event) async {
    try {
      await _addCartItem(event.cartItem);
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
      final updatedCartItem=CartItem(
          existingCartItem.id,
          existingCartItem.title,
          existingCartItem.image,
          existingCartItem.offerId,
          existingCartItem.count + cartItem.count,
          existingCartItem.price + cartItem.price);

      return _cartDataRepository.updateCartItem(updatedCartItem);
    } else {
      return _cartDataRepository.addCartItem(cartItem);
    }
  }
}

@immutable
abstract class CountGoodEvent {}

class CountGoodInitEvent extends CountGoodEvent{}

class CountGoodDecrementCountEvent extends CountGoodEvent{
  final cartItem;
  final price;
  CountGoodDecrementCountEvent(this.cartItem, this.price);
}

class CountGoodIncrementCountEvent extends CountGoodEvent{
  final cartItem;
  final price;
  CountGoodIncrementCountEvent(this.cartItem, this.price);
}

class CountGoodAddCartEvent extends CountGoodEvent{
  final CartItem cartItem;
  CountGoodAddCartEvent(this.cartItem);
}

@immutable
abstract class CountGoodState {}

class CountGoodInitState extends CountGoodState {}

class CountGoodApplyAddCartState extends CountGoodState {}

class CountGoodUpdateCountState extends CountGoodState{
  final cartItem;
  CountGoodUpdateCountState(this.cartItem);
}

class CountGoodErrorState extends CountGoodState {
  final dynamic error;
  CountGoodErrorState(this.error);
}