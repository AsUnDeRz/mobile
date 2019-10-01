import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app/domain/repository/user_repository.dart';

class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  final UserRepository _userDataRepository;

  AvatarBloc(this._userDataRepository);

  @override
  AvatarState get initialState => AvatarInitState();

  @override
  Stream<AvatarState> mapEventToState(AvatarEvent event) async* {
    if (event is AvatarActionEvent) {
      yield await _mapAvatarActionToState(event);
    }
  }

  Future<AvatarState> _mapAvatarActionToState(AvatarEvent event) async {
    final user = await _userDataRepository.getUser();
    final avatar = user.name[0].toUpperCase();
    return AvatarApplyState(avatar);
  }
}

@immutable
abstract class AvatarEvent {}

class AvatarActionEvent extends AvatarEvent{}

@immutable
abstract class AvatarState {}

class AvatarInitState extends AvatarState {}

class AvatarApplyState extends AvatarState {
  final avatar;
  AvatarApplyState(this.avatar);
}