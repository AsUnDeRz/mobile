import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/model/cart.dart';

class CartActionBloc extends Bloc<CartActionEvent, CartActionState> {
  final _cartDataRepository;
  StreamSubscription<Cart> _cartSubscription;

  CartActionBloc(this._cartDataRepository){
    _cartSubscription = _cartDataRepository
        .getCartStream()
        .listen((cart) => dispatch(CartActionRefreshEvent(cart)));
  }

  @override
  CartActionState get initialState => CartActionLoadingState();

  @override
  Stream<CartActionState> mapEventToState(CartActionEvent event) async* {
    if (event is CartActionRefreshEvent) {
      yield  _mapCartActionRefreshToState(event);
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

  CartActionState _mapCartActionRefreshToState(CartActionRefreshEvent event) {
    return CartActionReadyState(event.cart);
  }
}

@immutable
abstract class CartActionEvent {}

class CartActionRefreshEvent extends CartActionEvent {
  final cart;
  CartActionRefreshEvent(this.cart);
}

@immutable
abstract class CartActionState {}

class CartActionLoadingState extends CartActionState {}

class CartActionReadyState extends CartActionState {
  final cart;
  CartActionReadyState(this.cart);
}

class CartActionErrorState extends CartActionState {
  final dynamic error;
  CartActionErrorState(this.error);
}