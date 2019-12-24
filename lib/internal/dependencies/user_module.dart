import 'package:catalog_app_bloc/domain/bloc/form_login/checkbox_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/form_login/login_form_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/form_login/password_field_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/form_login/text_field_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/menu_drawer/avatar/avatar_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/menu_drawer/logout/logout_bloc.dart';
import 'package:catalog_app_bloc/internal/dependencies/user_repository_module.dart';

class UserModule {
  static AvatarBloc  avatarBloc(){
    return AvatarBloc(UserRepositoryModule.userRepository);
  }

  static LogoutBloc logoutBloc() {
    return LogoutBloc(UserRepositoryModule.userRepository);
  }

  static TextFieldBloc textFieldBloc() {
    return TextFieldBloc();
  }

  static PasswordFieldBloc passwordFieldBloc() {
    return PasswordFieldBloc();
  }

  static CheckboxBloc checkboxFieldBloc() {
    return CheckboxBloc();
  }

  static LoginFormBloc loginFormBloc() {
    return LoginFormBloc(textFieldBloc(), passwordFieldBloc(), checkboxFieldBloc(), UserRepositoryModule.userRepository,);
  }
}