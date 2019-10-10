import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:catalog_app_bloc/domain/repository/user_repository.dart';

class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  final UserRepository _userDataRepository;

  AvatarBloc(this._userDataRepository);

  @override
  AvatarState get initialState => InitState();

  @override
  Stream<AvatarState> mapEventToState(AvatarEvent event) async* {
    if (event is ActionEvent) {
      yield await _mapActionToState(event);
    }
  }

  Future<AvatarState> _mapActionToState(AvatarEvent event) async {
    final user = await _userDataRepository.getUser();
    final avatar = user.name[0].toUpperCase();
    return ApplyState(avatar);
  }
}

@immutable
abstract class AvatarEvent {}

class ActionEvent extends AvatarEvent{}

@immutable
abstract class AvatarState {}

class InitState extends AvatarState {}

class ApplyState extends AvatarState {
  final avatar;
  ApplyState(this.avatar);
}