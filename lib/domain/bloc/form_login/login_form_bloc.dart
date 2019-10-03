import 'dart:async';
import 'package:catalog_app/domain/bloc/form_login/checkbox_bloc.dart';
import 'package:catalog_app/domain/bloc/form_login/password_field_bloc.dart';
import 'package:catalog_app/domain/bloc/form_login/text_field_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/model/user.dart';
import 'package:catalog_app/domain/repository/user_repository.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final UserRepository _userDataRepository;
  final TextFieldBloc nameBloc;
  final PasswordFieldBloc passwordBloc;
  final CheckboxBloc checkboxBloc;
  int _countTryLogin = 0;
  bool get tryLogin  => _countTryLogin > 0;

  LoginFormBloc(this.nameBloc, this.passwordBloc, this.checkboxBloc, this._userDataRepository);

  @override
  LoginFormState get initialState => InitState();

  @override
  Stream<LoginFormState> mapEventToState(LoginFormEvent event) async* {
    ++_countTryLogin;
    if (event is LoginEvent) {
      yield await _mapLoginToState(event);
    }
    if (event is UpdateAgreeEvent) {
      _mapUpdateAgreeToState(event);
    }
  }

  Future<LoginFormState> _mapLoginToState(LoginEvent event) async {
    if(checkboxBloc.currentState.value == false ){
      return FailLoginState();
    }
    await _userDataRepository.setUser(User(nameBloc.value, passwordBloc.value));
    return SuccessLoginState();
  }

  void _mapUpdateAgreeToState(UpdateAgreeEvent event) {
    checkboxBloc.dispatch(CheckboxUpdateEvent());
  }
}

@immutable
abstract class LoginFormEvent {}

class LoginEvent extends LoginFormEvent{}
class UpdateAgreeEvent extends LoginFormEvent{}

@immutable
abstract class LoginFormState {}

class InitState extends LoginFormState {}
class SuccessLoginState extends LoginFormState {}
class FailLoginState extends LoginFormState {}