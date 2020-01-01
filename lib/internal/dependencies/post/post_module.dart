
import 'package:social_network/domain/bloc/home/flow_home_bloc.dart';
import 'package:social_network/domain/bloc/home/post_home_bloc.dart';
import 'package:social_network/internal/dependencies/post/post_repository_module.dart';

class PostModule {
//  static PostsBloc postsBloc() {
//    return PostsBloc(PostRepositoryModule.postDataRepository());
//  }
  static FlowHomeBloc flowHomeBloc(){
    return  FlowHomeBloc(PostRepositoryModule.postDataRepository());
  }
  static PostHomeBloc postHomeBloc(){
    return PostHomeBloc();
  }
}
