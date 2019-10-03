import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/model/cart.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final _cartDataRepository;
  StreamSubscription<Cart> _cartSubscription;

  CartBloc(this._cartDataRepository){
    _cartSubscription = _cartDataRepository
        .getCartStream()
        .listen((cart) => dispatch(RefreshEvent(cart)));
  }

  @override
  CartState get initialState => LoadingState();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
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
