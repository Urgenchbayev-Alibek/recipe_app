class Instruction {
  final String text;
  final int order;

  Instruction({
    required this.text,
    required this.order,
  });

  factory Instruction.fromJson(Map<String, dynamic>json){
    return Instruction(text: json['text'], order: json['order']);
  }
}
