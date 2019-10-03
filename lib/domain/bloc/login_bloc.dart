import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/model/user.dart';
import 'package:catalog_app/domain/repository/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userDataRepository;
  String _name;
  String _password;
  bool _agree = false;

  LoginBloc(this._userDataRepository);

  @override
  LoginState get initialState => InitState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is ActionEvent) {
      yield await _mapActionToState(event);
    }
    if (event is UpdateNameEvent) {
      _mapUpdateNameToState(event);
    }
    if (event is UpdatePasswordEvent) {
      _mapUpdatePasswordToState(event);
    }
    if (event is UpdateAgreeEvent) {
      yield  _mapUpdateAgreeToState(event);
    }
  }

  Future<LoginState> _mapActionToState(ActionEvent event) async {
    if(_agree == false ){
      return FailureAgreeState();
    }
    await _userDataRepository.setUser(User(_name, _password));
    return ApplyState();
  }

  void _mapUpdateNameToState(UpdateNameEvent event) {
    _name = event.name;
  }

  void _mapUpdatePasswordToState(UpdatePasswordEvent event) {
    _password = event.password;
  }

  LoginState _mapUpdateAgreeToState(UpdateAgreeEvent event) {
    _agree = event.agree;

    return UpdateAgreeState(_agree);
  }
}

@immutable
abstract class LoginEvent {}

class ActionEvent extends LoginEvent{}

class UpdateNameEvent extends LoginEvent{
  final name;
  UpdateNameEvent(this.name);
}

class UpdatePasswordEvent extends LoginEvent{
  final password;
  UpdatePasswordEvent(this.password);
}

class UpdateAgreeEvent extends LoginEvent{
  final agree;
  UpdateAgreeEvent(this.agree);
}

@immutable
abstract class LoginState {}

class InitState extends LoginState {}
class ReadyState extends LoginState {}
class ApplyState extends LoginState {}
class FailureAgreeState extends LoginState {}
class UpdateAgreeState extends LoginState {
  final agree;
  UpdateAgreeState(this.agree);
}