import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/bloc/form_login/checkbox_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/form_login/password_field_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/form_login/text_field_bloc.dart';
import 'package:catalog_app_bloc/domain/model/user.dart';
import 'package:catalog_app_bloc/domain/repository/user_repository.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final UserRepository _userDataRepository;
  final TextFieldBloc nameBloc;
  final PasswordFieldBloc passwordBloc;
  final CheckboxBloc checkboxBloc;
  int _countTryLogin = 0;
  bool get tryLogin  => _countTryLogin > 0;

  LoginFormBloc(this.nameBloc, this.passwordBloc, this.checkboxBloc, this._userDataRepository);

  @override
  LoginFormState get initialState => InitLoginFormState();

  @override
  Future<void> close() {
    nameBloc.close();
    passwordBloc.close();
    checkboxBloc.close();
    return super.close();
  }

  @override
  Stream<LoginFormState> mapEventToState(LoginFormEvent event) async* {
    ++_countTryLogin;
    if (event is TryLoginFormEvent) {
      if(checkboxBloc.value == true ) {
        yield await _mapLoginToState(event);
      }
    }
    if (event is UpdateAgreeLoginFormEvent) {
      _mapUpdateAgreeToState(event);
    }
    if (event is UnFocusLoginFormEvent) {
      if( nameBloc.focusNode.hasFocus){
        nameBloc.focusNode.unfocus();
      }
      if(passwordBloc.focusNode.hasFocus){
        passwordBloc.focusNode.unfocus();
      }
    }
  }

  Future<LoginFormState> _mapLoginToState(TryLoginFormEvent event) async {
    await _userDataRepository.setUser(User(nameBloc.value, passwordBloc.value));
    return SuccessLoginFormState();
  }

  void _mapUpdateAgreeToState(UpdateAgreeLoginFormEvent event) {
    checkboxBloc.add(UpdateCheckboxEvent());
  }
}

@immutable
abstract class LoginFormEvent {}

class TryLoginFormEvent extends LoginFormEvent{}
class UpdateAgreeLoginFormEvent extends LoginFormEvent{}
class UnFocusLoginFormEvent extends LoginFormEvent{}

@immutable
abstract class LoginFormState {}

class InitLoginFormState extends LoginFormState {}
class SuccessLoginFormState extends LoginFormState {}