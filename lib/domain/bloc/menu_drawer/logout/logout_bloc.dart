import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/repository/user_repository.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {

  final UserRepository _userDataRepository;

  LogoutBloc(this._userDataRepository);

  @override
  LogoutState get initialState => InitLogoutState();

  @override
  Stream<LogoutState> mapEventToState(LogoutEvent event) async* {
    if (event is InitLogoutEvent) {
      yield  _mapInitToState(event);
    }

    if (event is ActionLogoutEvent) {
      yield await _mapActionToState(event);
    }
  }

  LogoutState _mapInitToState(InitLogoutEvent event) {
    return InitLogoutState();
  }

  Future<LogoutState> _mapActionToState(ActionLogoutEvent event) async {
      await _userDataRepository.logout();
      return ApplyLogoutState();
  }
}

@immutable
abstract class LogoutEvent {}

class InitLogoutEvent extends LogoutEvent{}

class ActionLogoutEvent extends LogoutEvent{}

@immutable
abstract class LogoutState {}

class InitLogoutState extends LogoutState {}

class ApplyLogoutState extends LogoutState {}