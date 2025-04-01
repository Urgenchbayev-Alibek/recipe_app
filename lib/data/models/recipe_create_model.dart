class RecipeCreateModel {
  final int categoryId;
  final String title;
  final String description;
  final String difficulty;
  final int timeRequired;
  final List<Instruction> instructions;
  final List<Ingredient> ingredients;

  RecipeCreateModel({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.timeRequired,
    required this.instructions,
    required this.ingredients,
  });

  factory RecipeCreateModel.fromJson(Map<String, dynamic> json) {
    return RecipeCreateModel(
      categoryId: json['categoryId'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      difficulty: json['difficulty'] ?? 'Easy',
      timeRequired: json['timeRequired'] ?? 0,
      instructions: (json['instructions'] as List)
          .map((i) => Instruction.fromJson(i))
          .toList(),
      ingredients: (json['ingredients'] as List)
          .map((i) => Ingredient.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'timeRequired': timeRequired,
      'instructions': instructions.map((i) => i.toJson()).toList(),
      'ingredients': ingredients.map((i) => i.toJson()).toList(),
    };
  }
}

class Instruction {
  final String text;
  final int order;

  Instruction({required this.text, required this.order});

  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(
      text: json['text'] ?? '',
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'order': order,
    };
  }
}

class Ingredient {
  final String amount;
  final String name;
  final int order;

  Ingredient({required this.amount, required this.name, required this.order});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      amount: json['amount'] ?? '',
      name: json['name'] ?? '',
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'name': name,
      'order': order,
    };
  }
}
