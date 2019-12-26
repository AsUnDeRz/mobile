import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class PasswordFieldBloc extends Bloc<PasswordFieldEvent, PasswordFieldState> {
  FocusNode focusNode = FocusNode();
  String value = '';

  @override
  PasswordFieldState get initialState => PasswordFieldState();

  @override
  Stream<PasswordFieldState> mapEventToState(PasswordFieldEvent event) async* {
    if (event is PasswordFieldUpdateEvent) {
      _mapUpdateToState(event);
    }
  }

  void _mapUpdateToState(PasswordFieldUpdateEvent event) {
    value = event.value;
  }
}

@immutable
abstract class PasswordFieldEvent {}

class PasswordFieldUpdateEvent extends PasswordFieldEvent{
  final value;
  PasswordFieldUpdateEvent(this.value);
}

class PasswordFieldState {}

