import 'package:catalog_app_bloc/domain/model/user.dart';

abstract class UserRepository {
  Future<User> getUser();
  Future<void> setUser(User user);
  Future<void> logout();
}