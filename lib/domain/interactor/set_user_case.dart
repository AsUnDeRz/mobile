import 'package:catalog_app/domain/model/user.dart';
import 'package:catalog_app/domain/repository/user_repository.dart';

class SetUserCase {
  final UserRepository _userRepository;

  SetUserCase(this._userRepository);

  Future<void> setUser({name,password}) {
    return _userRepository.setUser(User(name, password));
  }
}