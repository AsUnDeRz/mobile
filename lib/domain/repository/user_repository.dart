import 'package:social_network/domain/model/profile_statistics.dart';
import 'package:social_network/domain/model/type_user_enum.dart';
import 'package:social_network/domain/model/user.dart';

abstract class UserRepository {
  Stream<User> getUserStream();
  Future<List<User>> getFollowers (int userId, int targetId,int page, {int itemsPerPage = 10});
  Future<List<User>> getFollowing (int userId, int targetId,int page, {int itemsPerPage = 10});

  Future<ProfileStatistics> getUserStatistics(int userId);
  Future<User> getMe();
  String getInviteLink();
  Future<TypeUser> getTypeUser({User user,int userId});
  Future<int> getFollowersAmount(int userId);
}
