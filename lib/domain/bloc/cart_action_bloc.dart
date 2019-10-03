import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/model/cart.dart';

class CartActionBloc extends  Bloc<CartActionEvent, CartActionState> {
  final _cartDataRepository;
  StreamSubscription<Cart> _cartSubscription;

  CartActionBloc(this._cartDataRepository){
    _cartSubscription = _cartDataRepository
        .getCartStream()
        .listen((cart) => dispatch(RefreshEvent(cart)));
  }

  @override
  CartActionState get initialState => LoadingState();

  @override
  Stream<CartActionState> mapEventToState(CartActionEvent event) async* {
    if (event is RefreshEvent) {
      yield  _mapRefreshToState(event);
    }
  }

  @override
  void dispose() {
    if (_cartSubscription != null) {
      _cartSubscription.cancel();
      _cartSubscription = null;
    }
    super.dispose();
  }

  CartActionState _mapRefreshToState(RefreshEvent event) {
    return ReadyState(event.cart);
  }
}

@immutable
abstract class CartActionEvent {}

class RefreshEvent extends CartActionEvent {
  final cart;
  RefreshEvent(this.cart);
}

@immutable
abstract class CartActionState {}

class LoadingState extends CartActionState {}

class ReadyState extends CartActionState {
  final cart;
  ReadyState(this.cart);
}

class ErrorState extends CartActionState {
  final dynamic error;
  ErrorState(this.error);
}