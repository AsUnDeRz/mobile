import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:social_network/domain/model/post.dart';
import 'package:social_network/domain/repository/post_repository.dart';
import 'package:social_network/domain/util/cache_manager.dart';

import 'post_home_bloc.dart';

class FlowHomeBloc extends Bloc<FlowHomeEvent, FlowHomeState> {
  final PostRepository _postRepository;
  int page = 0;
  int perPage = 5;
  int limitPage = 4;
  List<Post> listPosts =[];
  List<Post> listShowPost = [];
//  List<PostHomeBloc> listBlocs = [];

  ContentCacheManager _cacheManager;

  FlowHomeBloc(this._postRepository){
    this._cacheManager = ContentCacheManager();
  }
//
//  @override
//  void close() {
//    listBlocs.forEach((bloc)=>bloc.close());
//    super.close();
//  }

  @override
  FlowHomeState get initialState => InitFlowHomeState();

  @override
  Stream<FlowHomeState> mapEventToState(event) async* {
    if (event is InitFlowHomeEvent) {
      ++page;
      listPosts = await _postRepository.getRecommendationPosts();
      final List<Post> partList = listPosts.sublist(0, page*perPage);
      listShowPost.addAll(partList);
//      partList.forEach((post){
//        final bloc = PostHomeBloc();
//        bloc.add(InitPostHomeEvent(post.fileUrl));
//        listBlocs.add(bloc);
//      });
//      yield RefreshFlowHomeState(listShowPost, listBlocs);
      yield RefreshFlowHomeState(listShowPost);
    }
    if (event is NextPageFlowHomeEvent) {
      ++page;
      if(page > limitPage){
        yield EndPagesFlowHomeState();
        return;
      }
      final List<Post> partList = listPosts.sublist((page-1)*perPage, page*perPage);
      listShowPost.addAll(partList);
//      partList.forEach((post){
//        final bloc = PostHomeBloc();
//        bloc.add(InitPostHomeEvent(post.fileUrl));
//        listBlocs.add(bloc);
//      });
//      yield RefreshFlowHomeState(listShowPost, listBlocs);
      yield RefreshFlowHomeState(listShowPost);
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
//  final List<PostHomeBloc> listBlocs;

//  RefreshFlowHomeState(this.listPosts, this.listBlocs);
  RefreshFlowHomeState(this.listPosts);
}