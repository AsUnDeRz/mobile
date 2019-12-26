import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/model/application_theme.dart';
import 'package:catalog_app_bloc/domain/repository/application_theme_repository.dart';

class RefresherApplicationThemeBloc extends Bloc<RefresherApplicationThemeEvent, RefresherApplicationThemeState> {
  final ApplicationThemeRepository _applicationThemeDataRepository;
  StreamSubscription<ApplicationTheme> _applicationThemeSubscription;

  RefresherApplicationThemeBloc(this._applicationThemeDataRepository){
    _applicationThemeSubscription = _applicationThemeDataRepository
        .getApplicationThemeStream()
        .listen((applicationTheme) => add(RefreshEvent(applicationTheme)));
  }

  @override
  RefresherApplicationThemeState get initialState => LoadingRefresherApplicationThemeState();

  @override
  Future<void> close() {
    _applicationThemeSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<RefresherApplicationThemeState> mapEventToState(RefresherApplicationThemeEvent event) async* {
    if (event is RefreshEvent) {
      yield  _mapRefreshToState(event);
    }
  }

  RefresherApplicationThemeState _mapRefreshToState(RefreshEvent event) {
    return ReadyRefresherApplicationThemeState(event.applicationTheme);
  }
}

@immutable
abstract class RefresherApplicationThemeEvent {}

class RefreshEvent extends RefresherApplicationThemeEvent {
  final ApplicationTheme applicationTheme;
  RefreshEvent(this.applicationTheme);
}

@immutable
abstract class RefresherApplicationThemeState {}

class LoadingRefresherApplicationThemeState extends RefresherApplicationThemeState {}

class ReadyRefresherApplicationThemeState extends RefresherApplicationThemeState {
  final ApplicationTheme applicationTheme;
  ReadyRefresherApplicationThemeState(this.applicationTheme);
}

