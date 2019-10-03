import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/model/application_theme.dart';
import 'package:catalog_app/domain/repository/application_theme_repository.dart';

class ApplicationThemeBloc extends Bloc<ApplicationThemeEvent, ApplicationThemeState> {
  final ApplicationThemeRepository _applicationThemeDataRepository;
  StreamSubscription<ApplicationTheme> _applicationThemeSubscription;

  ApplicationThemeBloc(this._applicationThemeDataRepository){
    _applicationThemeSubscription = _applicationThemeDataRepository
        .getApplicationThemeStream()
        .listen((applicationTheme) => dispatch(RefreshEvent(applicationTheme)));
  }

  @override
  ApplicationThemeState get initialState => LoadingState();

  @override
  Stream<ApplicationThemeState> mapEventToState(ApplicationThemeEvent event) async* {
    if (event is RefreshEvent) {
      yield  _mapRefreshToState(event);
    }
    if (event is SwitchEvent) {
     await _mapSwitchToState(event);
    }
  }

  @override
  void dispose() {
    if (_applicationThemeSubscription != null) {
      _applicationThemeSubscription.cancel();
      _applicationThemeSubscription = null;
    }
    super.dispose();
  }

  ApplicationThemeState _mapRefreshToState(RefreshEvent event) {
    return ReadyState(event.applicationTheme);
  }

  Future<void> _mapSwitchToState(SwitchEvent event) async {
    final applicationTheme = await _applicationThemeDataRepository.getApplicationThemeStream().first;
    _applicationThemeDataRepository.setApplicationTheme(!applicationTheme.mode);
  }
}

@immutable
abstract class ApplicationThemeEvent {}

class RefreshEvent extends ApplicationThemeEvent {
  final ApplicationTheme applicationTheme;
  RefreshEvent(this.applicationTheme);
}

class SwitchEvent extends ApplicationThemeEvent {}

@immutable
abstract class ApplicationThemeState {}

class LoadingState extends ApplicationThemeState {}

class ReadyState extends ApplicationThemeState {
  final ApplicationTheme applicationTheme;
  ReadyState(this.applicationTheme);
}

