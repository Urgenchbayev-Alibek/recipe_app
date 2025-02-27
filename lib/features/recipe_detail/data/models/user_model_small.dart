class UserModelInRecipe {
  final int id;
  final String profilePhoto;
  final String username, fullName;

  UserModelInRecipe({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.fullName,
  });

  factory UserModelInRecipe.fromJson(Map<String, dynamic> json){
    return UserModelInRecipe(id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      fullName: json['fullName'],);
  }
}
