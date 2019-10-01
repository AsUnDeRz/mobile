import 'package:catalog_app/domain/bloc/login_bloc.dart';
import 'package:catalog_app/domain/bloc/menu_drawer/avatar/avatar_bloc.dart';
import 'package:catalog_app/domain/bloc/menu_drawer/logout/logout_bloc.dart';
import 'package:catalog_app/internal/dependencies/user_repository_module.dart';

class UserModule {
  static final avatarBloc = AvatarBloc(UserRepositoryModule.userRepository);

  static LogoutBloc logoutBloc() {
    return LogoutBloc(UserRepositoryModule.userRepository);
  }
  static LoginBloc loginBloc() {
    return LoginBloc(UserRepositoryModule.userRepository);
  }
}