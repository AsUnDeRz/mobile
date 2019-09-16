import 'package:catalog_app/domain/model/user.dart';
import 'package:catalog_app/domain/repository/user_repository.dart';

import 'package:catalog_app/data/sp/sp_util.dart';

class UserDataRepository extends UserRepository {

  SpUtil _spUtil;

  UserDataRepository (this._spUtil);

  @override
  Future<User> getUser() async {
    return User(
        await _spUtil.getName(),
        await _spUtil.getPassword());
  }

  @override
  Future<void> setUser(User user) async {
    await _spUtil.setName(user.name);
    await _spUtil.setPassword(user.password);
  }

  @override
  Future<void> resetUser() async {
    await _spUtil.setName('');
    await _spUtil.setPassword('');
  }
}