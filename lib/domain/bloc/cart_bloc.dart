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
        .listen((cart) => dispatch(CartRefreshEvent(cart)));
  }

  @override
  CartState get initialState => CartLoadingState();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartRefreshEvent) {
      yield  _mapCartRefreshToState(event);
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

  CartState _mapCartRefreshToState(CartRefreshEvent event) {
    return CartReadyState(event.cart);
  }
}

@immutable
abstract class CartEvent {}

class CartRefreshEvent extends CartEvent {
  final Cart cart;
  CartRefreshEvent(this.cart);
}

@immutable
abstract class CartState {}

class CartLoadingState extends CartState {}

class CartReadyState extends CartState {
  final Cart cart;
  CartReadyState(this.cart);
}
