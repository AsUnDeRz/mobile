import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/domain/bloc/view_bloc.dart';

import 'package:social_network/internal/dependencies/application_component.dart';
import 'package:social_network/presentation/home/home_screen.dart';

class ViewWidget extends StatefulWidget {
  @override
  _ViewWidgetState createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {
  ViewBloc _viewBloc = ViewModule.viewBloc();

  @override
  void dispose() {
    _viewBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBloc, ViewState>(
      bloc: _viewBloc,
      builder: (context, state){
        return HomeScreen();
      },
    );
  }
}