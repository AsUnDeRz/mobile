import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class ViewBloc extends Bloc<ViewEvent, ViewState> {
  @override
  ViewState get initialState => OriginViewState();

  @override
  Stream<ViewState> mapEventToState(event) async* {
    if (event is ProfileViewEvent) {
      yield ProfileViewState();
    }
  }
}

@immutable
abstract class ViewEvent {}

class ProfileViewEvent extends ViewEvent {}
class HomeViewEvent extends ViewEvent {}

@immutable
abstract class ViewState {}

class OriginViewState extends ViewState {}
class ProfileViewState extends ViewState {}
class HomeViewState extends ViewState {}