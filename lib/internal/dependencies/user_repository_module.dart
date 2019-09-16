import 'package:catalog_app/data/repository/user_data_repository.dart';
import 'package:catalog_app/internal/dependencies/sp_module.dart';

class UserRepositoryModule {

  static final userRepository = UserDataRepository(SpModule.spUtil);
}