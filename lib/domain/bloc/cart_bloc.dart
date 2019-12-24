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
        .listen((cart) => add(RefreshEvent(cart)));
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }

  @override
  CartState get initialState => LoadingState();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is RefreshEvent) {
      yield  _mapRefreshToState(event);
    }
  }

  CartState _mapRefreshToState(RefreshEvent event) {
    return ReadyState(event.cart);
  }
}

@immutable
abstract class CartEvent {}

class RefreshEvent extends CartEvent {
  final Cart cart;
  RefreshEvent(this.cart);
}

@immutable
abstract class CartState {}

class LoadingState extends CartState {}

class ReadyState extends CartState {
  final Cart cart;
  ReadyState(this.cart);
}
