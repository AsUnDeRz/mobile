import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/repository/user_repository.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {

  final UserRepository _userDataRepository;

  LogoutBloc(this._userDataRepository);

  @override
  LogoutState get initialState => LogoutInitState();

  @override
  Stream<LogoutState> mapEventToState(LogoutEvent event) async* {
    if (event is LogoutInitEvent) {
      yield  _mapLogoutInitToState(event);
    }

    if (event is LogoutActionEvent) {
      yield await _mapLogoutActionToState(event);
    }
  }

  LogoutState _mapLogoutInitToState(LogoutInitEvent event) {
    return LogoutInitState();
  }

  Future<LogoutState> _mapLogoutActionToState(LogoutEvent event) async {
      await _userDataRepository.logout();
      return LogoutApplyState();
  }
}

@immutable
abstract class LogoutEvent {}

class LogoutInitEvent extends LogoutEvent{}

class LogoutActionEvent extends LogoutEvent{}

@immutable
abstract class LogoutState {}

class LogoutInitState extends LogoutState {}

class LogoutApplyState extends LogoutState {}