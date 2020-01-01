import 'package:social_network/domain/model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getFollowingPosts();
  Future<List<Post>> getRecommendationPosts();
  Future<List<Post>> getUserPosts();
}
