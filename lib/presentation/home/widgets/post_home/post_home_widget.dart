import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_network/domain/bloc/home/post_home_bloc.dart';
import 'package:social_network/internal/dependencies/application_component.dart';
import 'package:social_network/presentation/design/application_design.dart';

class PostHomeWidget extends StatefulWidget {
  final String imageUrl;
  final PostHomeBloc bloc;

  PostHomeWidget({Key key, this.imageUrl, this.bloc}) : super(key: key);
//  PostHomeWidget({Key key, this.imageUrl}) : super(key: key);

  @override
  _PostHomeWidgetState createState() => _PostHomeWidgetState();
}

class _PostHomeWidgetState extends State<PostHomeWidget> {
//  final PostHomeBloc _postHomeBloc = PostModule.postHomeBloc();
//
//  @override
//  void initState() {
//    _postHomeBloc.add(InitPostHomeEvent(widget.imageUrl));
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    _postHomeBloc.close();
//    super.dispose();
//  }
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      duration: Duration(milliseconds: 1500),
      child: BlocBuilder<PostHomeBloc, PostHomeState>(
//      bloc: _postHomeBloc,
        bloc: widget.bloc,
        builder: (context, state){
          if(state is RefreshPostHomeState){
              return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(state.file),
                  fit: BoxFit.cover,
                ),
              ),
//              child: FadeInImage(
//                image: FileImage(state.file),
//                fit: BoxFit.cover,
//                fadeInDuration: Duration(milliseconds: 300),
//                fadeOutDuration: Duration(milliseconds: 300),
//                placeholder: AssetImage("assets/images/pixel.png"),
//
//              ),
            );
          }

          return LoadersWidget.loaderPost();
        },
      ),
    );
  }
}