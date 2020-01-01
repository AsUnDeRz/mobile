import 'dart:async';

import 'package:social_network/data/fixture/fixture_util.dart';
import 'package:social_network/domain/model/post.dart';
import 'package:social_network/domain/repository/post_repository.dart';


class PostDataRepository implements PostRepository {
  @override
  Future<List<Post>> getFollowingPosts() async {
    final List<Post> listPosts =  FixtureUtil.randomPosts(itemsPerPage: 100);
    return listPosts;
  }

  @override
  Future<List<Post>> getRecommendationPosts() async {
    final List<Post> listPosts =  FixtureUtil.randomPosts(itemsPerPage: 100);
    return listPosts;
  }

  @override
  Future<List<Post>> getUserPosts() async {
    final List<Post> listPosts =  FixtureUtil.randomPosts(itemsPerPage: 100);
    return listPosts;
  }
}
