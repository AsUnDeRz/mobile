import 'dart:async';
import 'package:catalog_app_bloc/domain/repository/cart_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/model/cart_item.dart';

class CountGoodBloc extends Bloc<CountGoodEvent, CountGoodState> {
  final CartRepository _cartDataRepository;
  CartItem _cartItem;

  CountGoodBloc(this._cartDataRepository);

  @override
  CountGoodState get initialState => LoadingCountGoodState();

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
    return UpdateCountCountGoodState(_cartItem);
  }

  CountGoodState _mapDecrementCountToState(DecrementCountEvent event) {
    final decrementedCount = _cartItem.count - 1;
    _cartItem = _cartItem.copyWith(count: decrementedCount);
    return UpdateCountCountGoodState(_cartItem);
  }

  CountGoodState _mapIncrementCountToState(IncrementCountEvent event) {
    final incrementedCount = _cartItem.count + 1;
    _cartItem = _cartItem.copyWith(count: incrementedCount);
    return UpdateCountCountGoodState(_cartItem);
  }

  Future<CountGoodState> _mapAddCartToState(AddCartEvent event) async {
    try {
      await _addCartItem(_cartItem);
      return ApplyAddCartCountGoodState();
    } catch(e) {
      return ErrorCountGoodState(e);
    }
  }

  Future<void> _addCartItem(CartItem cartItem) async {
    try {
      final cart = await _cartDataRepository
          .getCartStream()
          .first;
      final existingCartItem = cart.listItems.singleWhere(
        ((item) => item.offerId == cartItem.offerId),
        orElse: () => null,
      );

      if (existingCartItem != null) {
        final updatedCount = existingCartItem.count + cartItem.count;
        final updatedCartItem = existingCartItem.copyWith(count: updatedCount);
        return await _cartDataRepository.updateCartItem(updatedCartItem);
      }

      return await _cartDataRepository.addCartItem(cartItem);
    } catch(error) {
      print("error");
    }
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

class LoadingCountGoodState extends CountGoodState {}

class ApplyAddCartCountGoodState extends CountGoodState {}

class UpdateCountCountGoodState extends CountGoodState{
  final cartItem;
  UpdateCountCountGoodState(this.cartItem);
}

class ErrorCountGoodState extends CountGoodState {
  final dynamic error;
  ErrorCountGoodState(this.error);
}