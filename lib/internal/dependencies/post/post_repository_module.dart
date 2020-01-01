

import 'package:social_network/data/repository/post_data_repository.dart';

class PostRepositoryModule {
  static PostDataRepository _postRepository;

  static PostDataRepository postDataRepository() {
    if (_postRepository == null) {
      _postRepository = PostDataRepository();
    }
    return _postRepository;
  }
}