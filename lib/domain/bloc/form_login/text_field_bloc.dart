import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class TextFieldBloc extends Bloc<TextFieldEvent, TextFieldState> {
  FocusNode focusNode = FocusNode();
  String value = '';

  @override
  TextFieldState get initialState => TextFieldState();

  @override
  Stream<TextFieldState> mapEventToState(TextFieldEvent event) async* {
    if (event is TextFieldUpdateEvent) {
       _mapUpdateToState(event);
    }
  }

  void _mapUpdateToState(TextFieldUpdateEvent event) {
    value = event.value;
  }
}

@immutable
abstract class TextFieldEvent {}

class TextFieldUpdateEvent extends TextFieldEvent{
  final value;
  TextFieldUpdateEvent(this.value);
}

class TextFieldState {}