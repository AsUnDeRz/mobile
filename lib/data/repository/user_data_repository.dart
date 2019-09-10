import 'package:catalog_app/domain/model/user.dart';
import 'package:catalog_app/domain/repository/user_repository.dart';

import 'package:catalog_app/data/sp/sp_util.dart';

class UserDataRepository extends UserRepository {

  @override
  Future<User> getUser() async {
    return User(
        await SpUtil.getName(),
        await SpUtil.getPassword());
  }

  @override
  Future<void> setUser(User user) async {
    SpUtil.setName(user.name);
    SpUtil.setPassword(user.password);
  }

  @override
  Future<void> resetUser() async {
    SpUtil.setName('');
    SpUtil.setPassword('');
  }
}