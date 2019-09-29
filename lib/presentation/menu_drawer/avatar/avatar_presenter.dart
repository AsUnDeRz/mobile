import 'package:catalog_app/internal/dependencies/application_component.dart';
import 'package:catalog_app/presentation/menu_drawer/avatar/avatar_view.dart';

class AvatarPresenter {
  final _getUserCase = UserModule.getUserCase;
  final AvatarView _view;

  AvatarPresenter(this._view);

  void getAvatar(){
    _getUserCase.getUser()
        .then((user) => _view.onReceivedAvatar(user.name[0].toUpperCase()));
  }
}