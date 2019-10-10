import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/repository/user_repository.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {

  final UserRepository _userDataRepository;

  LogoutBloc(this._userDataRepository);

  @override
  LogoutState get initialState => InitState();

  @override
  Stream<LogoutState> mapEventToState(LogoutEvent event) async* {
    if (event is InitEvent) {
      yield  _mapInitToState(event);
    }

    if (event is ActionEvent) {
      yield await _mapActionToState(event);
    }
  }

  LogoutState _mapInitToState(InitEvent event) {
    return InitState();
  }

  Future<LogoutState> _mapActionToState(LogoutEvent event) async {
      await _userDataRepository.logout();
      return ApplyState();
  }
}

@immutable
abstract class LogoutEvent {}

class InitEvent extends LogoutEvent{}

class ActionEvent extends LogoutEvent{}

@immutable
abstract class LogoutState {}

class InitState extends LogoutState {}

class ApplyState extends LogoutState {}