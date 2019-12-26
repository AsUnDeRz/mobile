import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  bool value = true;

  @override
  CheckboxState get initialState => CheckboxState(value);

  @override
  Stream<CheckboxState> mapEventToState(CheckboxEvent event) async* {
    if (event is UpdateCheckboxEvent) {
     yield _mapUpdateToState(event);
    }
  }

  CheckboxState _mapUpdateToState(UpdateCheckboxEvent event) {
    value = !value;
    return CheckboxState(value);
  }
}

@immutable
abstract class CheckboxEvent {}

class UpdateCheckboxEvent extends CheckboxEvent{}

class CheckboxState {
  final bool value;
  CheckboxState(this.value);
}
