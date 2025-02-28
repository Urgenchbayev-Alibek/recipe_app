class RecipeModel {
  final int id;
  final int categoryId;
  final String title;
  final String description;
  final String photo;
  final num timeRequired;
  final num rating;

  RecipeModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json["id"],
      categoryId: json["categoryId"],
      title: json["title"],
      description: json["description"],
      photo: json["photo"],
      timeRequired: json["timeRequired"],
      rating: json["rating"],
    );
  }
}
