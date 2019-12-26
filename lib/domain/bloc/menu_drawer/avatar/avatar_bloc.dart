import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/repository/user_repository.dart';

class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  final UserRepository _userDataRepository;

  AvatarBloc(this._userDataRepository);

  @override
  AvatarState get initialState => InitAvatarState();

  @override
  Stream<AvatarState> mapEventToState(AvatarEvent event) async* {
    if (event is ActionAvatarEvent) {
      yield await _mapActionToState(event);
    }
  }

  Future<AvatarState> _mapActionToState(AvatarEvent event) async {
    final user = await _userDataRepository.getUser();
    final avatar = user.name[0].toUpperCase();
    return ApplyAvatarState(avatar);
  }
}

@immutable
abstract class AvatarEvent {}

class ActionAvatarEvent extends AvatarEvent{}

@immutable
abstract class AvatarState {}

class InitAvatarState extends AvatarState {}

class ApplyAvatarState extends AvatarState {
  final avatar;
  ApplyAvatarState(this.avatar);
}