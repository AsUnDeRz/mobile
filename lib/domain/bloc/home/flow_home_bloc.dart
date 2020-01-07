import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:social_network/domain/model/post.dart';
import 'package:social_network/domain/repository/post_repository.dart';

import 'post_home_bloc.dart';
import 'header_description_post_bloc.dart';
import 'footer_description_post_bloc.dart';

class FlowHomeBloc extends Bloc<FlowHomeEvent, FlowHomeState> {
  final PostRepository _postRepository;
  final HeaderDescriptionPostBloc headerDescriptionPostBloc;
  final FooterDescriptionPostBloc footerDescriptionPostBloc;
  int page = 0;
  int perPage = 10;
  int limitPage = 10;
  List<Post> listPosts =[];
  List<Post> listShowPost = [];
  List<PostHomeBloc> listBlocs = [];


  FlowHomeBloc(this._postRepository, this.headerDescriptionPostBloc, this.footerDescriptionPostBloc);

  @override
  void close() {
    listBlocs.forEach((bloc)=>bloc.close());
    headerDescriptionPostBloc.close();
    footerDescriptionPostBloc.close();
    super.close();
  }

  @override
  FlowHomeState get initialState => InitFlowHomeState();

  @override
  Stream<FlowHomeState> mapEventToState(event) async* {
    if (event is InitFlowHomeEvent) {
      ++page;
      listPosts = await _postRepository.getRecommendationPosts();
      final List<Post> partList = listPosts.sublist(0, page*perPage);
      listShowPost.addAll(partList);
      partList.forEach((post){
        PostHomeBloc bloc = PostHomeBloc();
        bloc.add(InitPostHomeEvent(post.fileUrl));
        listBlocs.add(bloc);
      });

      headerDescriptionPostBloc.add(UpdateHeaderDescriptionPostEvent(listShowPost.first));
      footerDescriptionPostBloc.add(UpdateFooterDescriptionPostEvent(listShowPost.first));
      yield RefreshFlowHomeState(listShowPost, listBlocs);
    }
    if (event is NextPageFlowHomeEvent) {
      ++page;
      if(page > limitPage){
        yield EndPagesFlowHomeState();
        return;
      }
      final List<Post> partList = listPosts.sublist((page-1)*perPage, page*perPage);
      listShowPost.addAll(partList);
      partList.forEach((post){
        PostHomeBloc bloc = PostHomeBloc();
        bloc.add(InitPostHomeEvent(post.fileUrl));
        listBlocs.add(bloc);
      });
      yield RefreshFlowHomeState(listShowPost, listBlocs);
    }
  }
}

@immutable
abstract class FlowHomeEvent {}

class InitFlowHomeEvent extends FlowHomeEvent {}
class NextPageFlowHomeEvent extends FlowHomeEvent {}

@immutable
abstract class FlowHomeState {}

class InitFlowHomeState extends FlowHomeState {}
class EndPagesFlowHomeState extends FlowHomeState {}
class RefreshFlowHomeState extends FlowHomeState {
  final List<Post> listPosts;
  final List<PostHomeBloc> listBlocs;

  RefreshFlowHomeState(this.listPosts, this.listBlocs);
}