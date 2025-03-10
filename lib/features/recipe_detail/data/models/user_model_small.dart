class UserModelInRecipe {
  // recipeDetailModel da ishlatilgan shuni ozgartirib qoy
  final int id;
  final String profilePhoto;
  final String username;

  // final String fullName;

  final String firstName;
  final String lastName;

  UserModelInRecipe({
    required this.id,
    required this.profilePhoto,
    required this.username,
    // required this.fullName,
    required this.firstName,
    required this.lastName,
  });

  factory UserModelInRecipe.fromJson(Map<String, dynamic> json) {
    return UserModelInRecipe(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      // fullName: json['fullName'],
      firstName: json['userName'],
      lastName: json['lastName'],
    );
  }
}
