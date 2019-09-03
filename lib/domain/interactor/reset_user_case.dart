import 'package:catalog_app/domain/repository/user_repository.dart';

class ResetUserCase {
  final UserRepository _userRepository;

  ResetUserCase(this._userRepository);

  Future<void> resetUser() {
    return _userRepository.resetUser();
  }
}