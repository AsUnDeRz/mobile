import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  bool _value = false;

  @override
  CheckboxState get initialState => CheckboxState(_value);

  @override
  Stream<CheckboxState> mapEventToState(CheckboxEvent event) async* {
    if (event is CheckboxUpdateEvent) {
     yield _mapUpdateToState(event);
    }
  }

  CheckboxState _mapUpdateToState(CheckboxUpdateEvent event) {
    _value = !_value;
    return CheckboxState(_value);
  }
}

@immutable
abstract class CheckboxEvent {}

class CheckboxUpdateEvent extends CheckboxEvent{}

class CheckboxState {
  final bool value;
  CheckboxState(this.value);
}
