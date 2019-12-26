import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/model/cart.dart';

class CartActionBloc extends  Bloc<CartActionEvent, CartActionState> {
  final _cartDataRepository;
  StreamSubscription<Cart> _cartSubscription;

  CartActionBloc(this._cartDataRepository){
    _cartSubscription = _cartDataRepository
        .getCartStream()
        .listen((cart) => add(RefreshCartActionEvent(cart)));
  }

  @override
  CartActionState get initialState => LoadingCartActionState();

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<CartActionState> mapEventToState(CartActionEvent event) async* {
    if (event is RefreshCartActionEvent) {
      yield  _mapRefreshToState(event);
    }
  }

  CartActionState _mapRefreshToState(RefreshCartActionEvent event) {
    return ReadyCartActionState(event.cart);
  }
}

@immutable
abstract class CartActionEvent {}

class RefreshCartActionEvent extends CartActionEvent {
  final cart;
  RefreshCartActionEvent(this.cart);
}

@immutable
abstract class CartActionState {}

class LoadingCartActionState extends CartActionState {}

class ReadyCartActionState extends CartActionState {
  final cart;
  ReadyCartActionState(this.cart);
}

class ErrorCartActionState extends CartActionState {
  final dynamic error;
  ErrorCartActionState(this.error);
}