
import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/menu_drawer/avatar/avatar_presenter.dart';
import 'package:catalog_app/presentation/menu_drawer/avatar/avatar_view.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  @override
  _AvatarWidgetState createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> implements AvatarView {

  String _avatar;
  AvatarPresenter _avatarPresenter;

  _AvatarWidgetState(){
    _avatarPresenter = AvatarPresenter(this);
  }

  @override
  void initState() {
    _avatarPresenter.getAvatar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(_avatar == null){
      return  LoaderPage();
    }

    return DrawerHeader(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          _avatar,
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }

  @override
  void onReceivedAvatar(String avatar) {
    setState(() {
      _avatar = avatar;
    });
  }
}