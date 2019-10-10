import 'package:catalog_app_bloc/data/repository/user_data_repository.dart';
import 'package:catalog_app_bloc/internal/dependencies/sp_module.dart';

class UserRepositoryModule {
  static final userRepository = UserDataRepository(SpModule.spUtil());
}