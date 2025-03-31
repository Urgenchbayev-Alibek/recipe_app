class TopChefProfile {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;
  final String presentation;
  final int recipesCount;
  final int followingCount;
  final int followerCount;

  TopChefProfile({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.presentation,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory TopChefProfile.fromJson(Map<String, dynamic> json) {
    return TopChefProfile(
      id: json["id"],
      profilePhoto: json["profilePhoto"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      presentation: json["presentation"],
      recipesCount: json["recipesCount"],
      followingCount: json["followingCount"],
      followerCount: json["followerCount"],
    );
  }
}
