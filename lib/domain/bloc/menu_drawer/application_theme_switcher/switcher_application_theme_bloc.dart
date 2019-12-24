import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/repository/application_theme_repository.dart';
import 'package:catalog_app_bloc/domain/model/application_theme.dart';

class SwitcherApplicationThemeBloc extends Bloc<SwitcherApplicationThemeEvent, SwitcherApplicationThemeState> {
  final ApplicationThemeRepository _applicationThemeDataRepository;
  StreamSubscription<ApplicationTheme> _applicationThemeSubject;

  SwitcherApplicationThemeBloc(this._applicationThemeDataRepository){
    _applicationThemeSubject = _applicationThemeDataRepository
        .getApplicationThemeStream()
        .listen((applicationTheme) => add(RefreshEvent(applicationTheme)));
  }

  @override
  SwitcherApplicationThemeState get initialState => LoadingState();

  @override
  Future<void> close() {
    _applicationThemeSubject?.cancel();
    return super.close();
  }

  @override
  Stream<SwitcherApplicationThemeState> mapEventToState(SwitcherApplicationThemeEvent event) async* {
    if (event is RefreshEvent) {
      yield  _mapRefreshToState(event);
    }
    if (event is SwitchEvent) {
     await _mapSwitchToState(event);
    }
  }

  SwitcherApplicationThemeState _mapRefreshToState(RefreshEvent event) {
    return ReadyState(event.applicationTheme);
  }

  Future<void> _mapSwitchToState(SwitchEvent event) async {
    final applicationTheme = await _applicationThemeDataRepository.getApplicationThemeStream().first;
    _applicationThemeDataRepository.setApplicationTheme(!applicationTheme.mode);
  }
}

@immutable
abstract class SwitcherApplicationThemeEvent {}

class RefreshEvent extends SwitcherApplicationThemeEvent {
  final ApplicationTheme applicationTheme;
  RefreshEvent(this.applicationTheme);
}

class SwitchEvent extends SwitcherApplicationThemeEvent {}

@immutable
abstract class SwitcherApplicationThemeState {}

class LoadingState extends SwitcherApplicationThemeState {}

class ReadyState extends SwitcherApplicationThemeState {
  final ApplicationTheme applicationTheme;
  ReadyState(this.applicationTheme);
}

