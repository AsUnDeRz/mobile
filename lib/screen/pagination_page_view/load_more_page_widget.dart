//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:p1440/domain/bloc/post/load_more_post_bloc.dart';
//import 'package:p1440/internal/dependencies/application_component.dart';
//import 'package:p1440/presentation/design/application_design.dart';
//
//class LoadMorePageWidget extends StatefulWidget {
//  @override
//  _LoadMorePageWidgetState createState() => _LoadMorePageWidgetState();
//}
//
//class _LoadMorePageWidgetState extends State<LoadMorePageWidget> {
//  final LoadMorePostBloc loadMorePostBloc = PostModule.loadMorePostBloc();
//
//  @override
//  void dispose() {
//    loadMorePostBloc.close();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return BlocBuilder<LoadMorePostBloc, LoadMorePostState>(
//      bloc: loadMorePostBloc,
//      builder: (context, state) {
//        if(state is NoPostLoadMorePostState){
//          return Center(
//            child: Text("No more post today"),
//          );
//        }
//        if(state is ErrorLoadMorePostState){
//          return Center(
//            child: Text("Sorry, error..."),
//          );
//        }
//
//        return Center(
//          child: LoaderPageStandard(),
//        );
//      },
//    );
//  }
//}