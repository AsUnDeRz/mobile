import 'package:social_network/domain/bloc/home/flow_home_bloc.dart';
import 'package:social_network/domain/bloc/home/footer_description_post_bloc.dart';
import 'package:social_network/domain/bloc/home/header_description_post_bloc.dart';
import 'package:social_network/domain/bloc/home/post_home_bloc.dart';
import 'package:social_network/internal/dependencies/post/post_repository_module.dart';

class PostModule {

  static HeaderDescriptionPostBloc headerDescriptionPostBloc(){
    return HeaderDescriptionPostBloc();
  }

  static FooterDescriptionPostBloc footerDescriptionPostBloc(){
    return FooterDescriptionPostBloc();
  }

  static FlowHomeBloc flowHomeBloc(){
    return  FlowHomeBloc(PostRepositoryModule.postDataRepository(), headerDescriptionPostBloc(), footerDescriptionPostBloc());
  }
  static PostHomeBloc postHomeBloc(){
    return PostHomeBloc();
  }
}
