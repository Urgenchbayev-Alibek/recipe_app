class TopChefProfileModel {
  final int id;
  final String name;
  final String imageUrl;
  final String bio;
  final double rating;
  final int totalRecipes;

  TopChefProfileModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.bio,
    required this.rating,
    required this.totalRecipes,
  });

  factory TopChefProfileModel.fromJson(Map<String, dynamic> json) {
    return TopChefProfileModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      bio: json['bio'],
      rating: (json['rating'] as num).toDouble(),
      totalRecipes: json['totalRecipes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'bio': bio,
      'rating': rating,
      'totalRecipes': totalRecipes,
    };
  }
}
