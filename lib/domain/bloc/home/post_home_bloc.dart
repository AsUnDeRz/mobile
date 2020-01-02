import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:social_network/domain/util/cache_manager.dart';

class PostHomeBloc extends Bloc<PostHomeEvent, PostHomeState> {
  ContentCacheManager _cacheManager;

  PostHomeBloc(){
    this._cacheManager = ContentCacheManager();
  }

  @override
  PostHomeState get initialState => InitPostHomeState();

  @override
  Stream<PostHomeState> mapEventToState(event) async* {
    if (event is InitPostHomeEvent) {
      try{
        var cached = _cacheManager.getFileFromMemory(event.imageUrl);
        if( cached == null) {
          final file = await _cacheManager.downloadFile(event.imageUrl);
          yield RefreshPostHomeState(file.file);
          return;
        }
        yield RefreshPostHomeState(cached.file);
      } catch (_) {
        yield ErrorPostHomeState();
      }
    }
  }
}

abstract class PostHomeEvent {}

class InitPostHomeEvent extends PostHomeEvent {
  final String imageUrl;

  InitPostHomeEvent(this.imageUrl);
}

abstract class PostHomeState {}

class InitPostHomeState extends PostHomeState {}
class ErrorPostHomeState extends PostHomeState {}
class RefreshPostHomeState extends PostHomeState {
  final File file;

  RefreshPostHomeState(this.file);
}