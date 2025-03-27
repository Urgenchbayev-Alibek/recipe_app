class ProfileModel {
  final int id;
  final String firstName, lastName, username, presentation;
  final String image;
  final int recipes, following, followers;

  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.presentation,
    required this.image,
    required this.recipes,
    required this.following,
    required this.followers,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      presentation: json['presentation'],
      image: json['profilePhoto'],
      recipes: json['recipesCount'],
      following: json['followingCount'],
      followers: json['followerCount'],
    );
  }
}
