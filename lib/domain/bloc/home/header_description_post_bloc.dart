import 'package:bloc/bloc.dart';

import 'package:social_network/domain/model/post.dart';

class HeaderDescriptionPostBloc extends  Bloc<HeaderDescriptionPostEvent, HeaderDescriptionPostState>{

  @override
  HeaderDescriptionPostState get initialState => LoadingHeaderDescriptionPostState();

  @override
  Stream<HeaderDescriptionPostState> mapEventToState(HeaderDescriptionPostEvent event) async *{
    if(event is UpdateHeaderDescriptionPostEvent){
      yield RefreshHeaderDescriptionPostState(event.post);
    }
  }
}

abstract class HeaderDescriptionPostEvent {}

class UpdateHeaderDescriptionPostEvent extends HeaderDescriptionPostEvent {
  final Post post;

  UpdateHeaderDescriptionPostEvent(this.post);
}

abstract class HeaderDescriptionPostState {}

class LoadingHeaderDescriptionPostState extends HeaderDescriptionPostState {}
class RefreshHeaderDescriptionPostState extends HeaderDescriptionPostState {
  final Post post;

  RefreshHeaderDescriptionPostState(this.post);
}