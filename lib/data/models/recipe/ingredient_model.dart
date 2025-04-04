class IngredientModel {
  final String name;
  final String? amount;
  final int order;

  IngredientModel({
    required this.name,
    required this.order,
    this.amount,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      name: json['name'],
      order: json['order'],
      amount: json['amount'],
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
