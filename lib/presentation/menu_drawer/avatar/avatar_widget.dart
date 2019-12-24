import 'package:catalog_app_bloc/domain/bloc/menu_drawer/avatar/avatar_bloc.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app_bloc/presentation/design/application_design.dart';


class AvatarWidget extends StatefulWidget {
  @override
  _AvatarWidgetState createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  AvatarBloc _avatarBloc = UserModule.avatarBloc();

  @override
  void initState() {
    _avatarBloc.add(ActionEvent());
    super.initState();
  }

  @override
  void dispose() {
    _avatarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvatarBloc, AvatarState>(
      bloc: _avatarBloc,
      builder: (context, state) {
        if (state is ApplyState) {
          return DrawerHeader(
            margin: EdgeInsets.only(bottom: .0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                state.avatar,
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          );
        }
        return LoaderPage();
      },
    );
  }
}
