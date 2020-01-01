import 'package:social_network/data/repository/user_data_repository.dart';

class UserRepositoryModule {
  static UserDataRepository _userDataRepository;

  static UserDataRepository userDataRepository() {
    if (_userDataRepository == null) {
      _userDataRepository = UserDataRepository();
    }
    return _userDataRepository;
  }
}
