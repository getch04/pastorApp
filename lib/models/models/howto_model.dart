class HowToModel {
  final int id;
  final String question;
  final String answer;
  final String? audio;

  HowToModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.audio,
  });

  factory HowToModel.fromJson(Map<String, dynamic> json) {
    return HowToModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
      audio: json['audio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'audio': audio,
    };
  }
}
