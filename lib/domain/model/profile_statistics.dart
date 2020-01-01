class ProfileStatistics {
  final int followingAmount;
  final int followersAmount;

  ProfileStatistics(this.followingAmount, this.followersAmount, );
  ProfileStatistics copyWith({int followingAmount, int followersAmount, int viewsAmount}) {
    return ProfileStatistics(
      followingAmount ?? this.followingAmount,
      followersAmount ?? this.followersAmount,
    );
  }
}
