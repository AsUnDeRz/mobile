import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/model/cart.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final _cartDataRepository;
  StreamSubscription<Cart> _cartSubscription;

  CartBloc(this._cartDataRepository){
    _cartSubscription = _cartDataRepository
        .getCartStream()
        .listen((cart) => add(RefreshCartEvent(cart)));
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }

  @override
  CartState get initialState => LoadingCartState();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is RefreshCartEvent) {
      yield  _mapRefreshToState(event);
    }
  }

  CartState _mapRefreshToState(RefreshCartEvent event) {
    return ReadyCartState(event.cart);
  }
}

@immutable
abstract class CartEvent {}

class RefreshCartEvent extends CartEvent {
  final Cart cart;
  RefreshCartEvent(this.cart);
}

@immutable
abstract class CartState {}

class LoadingCartState extends CartState {}

class ReadyCartState extends CartState {
  final Cart cart;
  ReadyCartState(this.cart);
}
