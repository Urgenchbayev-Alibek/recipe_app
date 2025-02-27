class Ingredient {
  final String? amount;
  final String name;
  final int order;

  Ingredient({
    required this.amount,
    required this.name,
    required this.order,
  });

  factory Ingredient.fromJson(Map<String, dynamic>json){
    return Ingredient(amount: json['amount'], name: json['name'], order: json['order']);
  }
}
