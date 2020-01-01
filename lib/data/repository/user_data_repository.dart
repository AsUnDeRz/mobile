import 'dart:async';
import 'dart:core';

import 'package:rxdart/rxdart.dart';
import 'package:social_network/domain/model/profile_statistics.dart';
import 'package:social_network/domain/model/type_user_enum.dart';
import 'package:social_network/domain/model/user.dart';
import 'package:social_network/domain/repository/user_repository.dart';


class UserDataRepository implements UserRepository {
  final _userSubject = BehaviorSubject<User>();

  UserDataRepository();


  @override
  Future<TypeUser> getTypeUser({int userId, User user}) async {
    if(userId != null && userId != null){
      throw Exception("Either userId or user");
    }
    final userMe = await getMe();
    if (userMe == null) {
      return TypeUser.anonymous;
    }
    final targetId =(user != null)?user.id :userId;
    if (userMe.id == targetId) {
      return TypeUser.own;
    }
    return TypeUser.other;
  }


  @override
  Future<List<User>> getFollowers(int userId, int targetId, int page, {int itemsPerPage = 10}) async {
    return null;
  }

  @override
  Future<int> getFollowersAmount(int userId) async {
    // TODO: implement getFollowersAmount
    return null;
  }

  @override
  Future<List<User>> getFollowing(int userId, int targetId, int page, {int itemsPerPage = 10}) async {
    // TODO: implement getFollowing
    return null;
  }

  @override
  String getInviteLink() {
    return "Invite link";
  }

  @override
  Future<User> getMe() async {
    // TODO: implement getMe
    return null;
  }

  @override
  Future<ProfileStatistics> getUserStatistics(int userId) async {
    return null;
  }

  @override
  Stream<User> getUserStream() {
    // TODO: implement getUserStream
    return null;
  }

  void _userUpdate(User user) {
    _userSubject.add(user);
  }
}
