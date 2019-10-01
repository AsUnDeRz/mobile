import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/model/user.dart';
import 'package:catalog_app/domain/repository/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userDataRepository;

  LoginBloc(this._userDataRepository);

  @override
  LoginState get initialState => LoginInitState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

    if (event is LoginActionEvent) {
      yield await _mapLoginActionToState(event);
    }
  }

  Future<LoginState> _mapLoginActionToState(LoginActionEvent event) async {
    await _userDataRepository.setUser(User(event.name,event.password));
    return LoginApplyState();
  }
}

@immutable
abstract class LoginEvent {}

class LoginActionEvent extends LoginEvent{
  final name;
  final password;
  LoginActionEvent(this.name, this.password);
}

@immutable
abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginApplyState extends LoginState {}