import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_network/domain/bloc/home/post_home_bloc.dart';
import 'package:social_network/presentation/design/application_design.dart';

class PostHomeWidget extends StatefulWidget {
  final String imageUrl;
  final PostHomeBloc bloc;

  PostHomeWidget({Key key, this.imageUrl, this.bloc}) : super(key: key);

  @override
  _PostHomeWidgetState createState() => _PostHomeWidgetState();
}

class _PostHomeWidgetState extends State<PostHomeWidget> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostHomeBloc, PostHomeState>(
      bloc: widget.bloc,
      builder: (context, state){
        if(state is RefreshPostHomeState){
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: FadeInImage(
              image: FileImage(state.file),
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 100),
              fadeOutDuration: Duration(milliseconds: 100),
              placeholder: AssetImage("assets/images/pixel.png"),

            ),
          );
        }
        if(state is ErrorPostHomeState){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.broken_image,
                size: 32,
                color: Colors.white,
              ),
              Container(
                height: 10,
              ),
              Text("Sorry, can't load image")
            ],
          );
        }

        return LoadersWidget.loaderPost();
      },
    );
  }
}