class YourRecipesModel {
  final int id;
  final int categoryId;
  final String title, description;
  final String difficulty;
  final String photo;
  final int timeRequired;
  final num rating;

  YourRecipesModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory YourRecipesModel.fromJson(Map<String, dynamic> json) {
    return YourRecipesModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      difficulty: json['difficulty'],
      photo: json['photo'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
    );
  }
}
