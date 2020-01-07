import 'package:bloc/bloc.dart';

import 'package:social_network/domain/model/post.dart';

class FooterDescriptionPostBloc extends  Bloc<FooterDescriptionPostEvent, FooterDescriptionPostState>{

  @override
  FooterDescriptionPostState get initialState => LoadingFooterDescriptionPostState();

  @override
  Stream<FooterDescriptionPostState> mapEventToState(FooterDescriptionPostEvent event) async *{
    if(event is UpdateFooterDescriptionPostEvent){
      yield RefreshFooterDescriptionPostState(event.post);
    }
  }
}

abstract class FooterDescriptionPostEvent {}

class UpdateFooterDescriptionPostEvent extends FooterDescriptionPostEvent {
  final Post post;

  UpdateFooterDescriptionPostEvent(this.post);
}

abstract class FooterDescriptionPostState {}

class LoadingFooterDescriptionPostState extends FooterDescriptionPostState {}
class RefreshFooterDescriptionPostState extends FooterDescriptionPostState {
  final Post post;

  RefreshFooterDescriptionPostState(this.post);
}