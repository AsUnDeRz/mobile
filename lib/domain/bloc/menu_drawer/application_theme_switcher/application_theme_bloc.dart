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
        .listen((applicationTheme) => dispatch(ApplicationThemeRefreshEvent(applicationTheme)));
  }

  @override
  ApplicationThemeState get initialState => ApplicationThemeLoadingState();

  @override
  Stream<ApplicationThemeState> mapEventToState(ApplicationThemeEvent event) async* {
    if (event is ApplicationThemeRefreshEvent) {
      yield  _mapApplicationThemeRefreshToState(event);
    }
    if (event is ApplicationThemeSwitchEvent) {
     await _mapApplicationThemeSwitchToState(event);
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

  ApplicationThemeState _mapApplicationThemeRefreshToState(ApplicationThemeRefreshEvent event) {
    return ApplicationThemeReadyState(event.applicationTheme);
  }

  Future<void> _mapApplicationThemeSwitchToState(ApplicationThemeSwitchEvent event) async {
    final applicationTheme = await _applicationThemeDataRepository.getApplicationThemeStream().first;
    _applicationThemeDataRepository.setApplicationTheme(!applicationTheme.mode);
  }
}

@immutable
abstract class ApplicationThemeEvent {}

class ApplicationThemeRefreshEvent extends ApplicationThemeEvent {
  final ApplicationTheme applicationTheme;
  ApplicationThemeRefreshEvent(this.applicationTheme);
}

class ApplicationThemeSwitchEvent extends ApplicationThemeEvent {}

@immutable
abstract class ApplicationThemeState {}

class ApplicationThemeLoadingState extends ApplicationThemeState {}

class ApplicationThemeReadyState extends ApplicationThemeState {
  final ApplicationTheme applicationTheme;
  ApplicationThemeReadyState(this.applicationTheme);
}

