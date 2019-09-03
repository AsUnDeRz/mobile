import 'package:catalog_app/domain/interactor/get_user_case.dart';
import 'package:catalog_app/domain/interactor/set_user_case.dart';
import 'package:catalog_app/domain/interactor/reset_user_case.dart';

import 'user_repository_module.dart';

class UserModule {
  static final getUserCase = GetUserCase(
      UserRepositoryModule.userRepository
  );
  static final setUserCase = SetUserCase(
      UserRepositoryModule.userRepository
  );
  static final resetUserCase = ResetUserCase(
      UserRepositoryModule.userRepository
  );
}