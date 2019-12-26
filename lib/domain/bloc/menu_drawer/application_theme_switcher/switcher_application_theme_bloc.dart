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
        .listen((applicationTheme) => add(RefreshSwitcherApplicationThemeEvent(applicationTheme)));
  }

  @override
  SwitcherApplicationThemeState get initialState => LoadingSwitcherApplicationThemeState();

  @override
  Future<void> close() {
    _applicationThemeSubject?.cancel();
    return super.close();
  }

  @override
  Stream<SwitcherApplicationThemeState> mapEventToState(SwitcherApplicationThemeEvent event) async* {
    if (event is RefreshSwitcherApplicationThemeEvent) {
      yield  _mapRefreshToState(event);
    }
    if (event is SwitchSwitcherApplicationThemeEvent) {
     await _mapSwitchToState(event);
    }
  }

  SwitcherApplicationThemeState _mapRefreshToState(RefreshSwitcherApplicationThemeEvent event) {
    return ReadySwitcherApplicationThemeState(event.applicationTheme);
  }

  Future<void> _mapSwitchToState(SwitchSwitcherApplicationThemeEvent event) async {
    final applicationTheme = await _applicationThemeDataRepository.getApplicationThemeStream().first;
    _applicationThemeDataRepository.setApplicationTheme(!applicationTheme.mode);
  }
}

@immutable
abstract class SwitcherApplicationThemeEvent {}

class RefreshSwitcherApplicationThemeEvent extends SwitcherApplicationThemeEvent {
  final ApplicationTheme applicationTheme;
  RefreshSwitcherApplicationThemeEvent(this.applicationTheme);
}

class SwitchSwitcherApplicationThemeEvent extends SwitcherApplicationThemeEvent {}

@immutable
abstract class SwitcherApplicationThemeState {}

class LoadingSwitcherApplicationThemeState extends SwitcherApplicationThemeState {}

class ReadySwitcherApplicationThemeState extends SwitcherApplicationThemeState {
  final ApplicationTheme applicationTheme;
  ReadySwitcherApplicationThemeState(this.applicationTheme);
}

