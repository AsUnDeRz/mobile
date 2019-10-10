import 'package:catalog_app_bloc/domain/model/user.dart';
import 'package:catalog_app_bloc/domain/repository/user_repository.dart';
import 'package:catalog_app_bloc/data/sp/sp_util.dart';

class UserDataRepository extends UserRepository {
  SpUtil _spUtil;

  UserDataRepository (this._spUtil);

  @override
  Future<User> getUser() async {
    final name = await _spUtil.getName();
    final password = await _spUtil.getPassword();

    return User(name, password);
  }

  @override
  Future<void> setUser(User user) async {
    await _spUtil.setName(user.name);
    await _spUtil.setPassword(user.password);
  }

  @override
  Future<void> logout() async {
    await _spUtil.setName('');
    await _spUtil.setPassword('');
  }
}