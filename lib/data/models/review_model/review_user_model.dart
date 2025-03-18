
class ReviewerUserModel {
  final int id;
  final String userPhoto, username, firstName, lastName;

  ReviewerUserModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.userPhoto,
    required this.id,
  });

  factory ReviewerUserModel.fromJson(Map<String, dynamic> json) {
    return ReviewerUserModel(
      username: json['username'],
      userPhoto: json['profilePhoto'],
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
