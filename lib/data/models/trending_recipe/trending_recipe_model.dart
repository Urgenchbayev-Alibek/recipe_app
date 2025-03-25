class TrendingRecipeModel {
  final int id;
  final int categoryId;
  final String title, desc;
  final String photo;
  final String timeRequired;
  final num rating;

  TrendingRecipeModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.desc,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory TrendingRecipeModel.fromJson(Map<String, dynamic> json) {
    return TrendingRecipeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      desc: json['description'],
      photo: json['photo'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
    );
  }

}
