import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/domain/bloc/navigation_bloc.dart';
import 'package:social_network/domain/bloc/view_bloc.dart';

import 'package:social_network/internal/dependencies/application_component.dart';
import 'package:social_network/presentation/home/home_screen.dart';

class ViewWidget extends StatefulWidget {
  final NavigationBloc navigationBloc;

  const ViewWidget({Key key, this.navigationBloc}) : super(key: key);
  @override
  _ViewWidgetState createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBloc, ViewState>(
      bloc: widget.navigationBloc.viewBloc,
      builder: (context, state){

        return HomeScreen();
      },
    );
  }
}