import 'user.dart';

class Post {
  final int id;
  final String fileUrl;
  final int likesAmount;
  final int sharesAmount;
  final int viewsAmount;
  final DateTime date;
  final User creator;
  final String filePath;
  final int creatorId;
  final bool liked;
  final bool shared;

  Post({
    this.id,
    this.fileUrl,
    this.likesAmount,
    this.sharesAmount,
    this.viewsAmount,
    this.date,
    this.creator,
    this.creatorId,
    this.filePath,
    this.liked,
    this.shared
  });

  Post copyWith({
    String path,
    User creator,
    bool liked,
    bool shared,
    int likesCount,
    int sharesCount,
    int commentsCount,
    int viewsCount,
    String description
  }) {
    return Post(
      id: this.id,
      fileUrl: fileUrl ?? this.fileUrl,
      likesAmount: likesCount ?? this.likesAmount,
      sharesAmount: sharesCount ?? this.sharesAmount,
      viewsAmount: viewsCount ?? this.viewsAmount,
      date: this.date,
      creator: creator ?? this.creator,
      creatorId: this.creatorId,
      liked: liked ?? this.liked,
      filePath: path ?? this.filePath,
      shared: shared ?? this.shared
    );
  }
}