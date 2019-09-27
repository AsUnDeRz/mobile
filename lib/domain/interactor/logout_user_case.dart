import 'package:catalog_app/domain/repository/user_repository.dart';

class LogoutUserCase {
  final UserRepository _userRepository;

  LogoutUserCase(this._userRepository);

  Future<void> resetUser() {
    return _userRepository.resetUser();
  }
}