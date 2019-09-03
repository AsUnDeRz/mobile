import 'package:catalog_app/domain/model/user.dart';
import 'package:catalog_app/domain/repository/user_repository.dart';

class GetUserCase {
  final UserRepository _userRepository;

  GetUserCase(this._userRepository);

  Future<User> getUser() {
    return _userRepository.getUser();
  }
}