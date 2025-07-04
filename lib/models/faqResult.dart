class FAQResponse {
  final String status;
  final List<FAQ> faqs;

  FAQResponse({required this.status, required this.faqs});

  factory FAQResponse.fromJson(Map<String, dynamic> json) {
    var list = json['faqs'] as List;
    List<FAQ> faqList = list.map((i) => FAQ.fromJson(i)).toList();

    return FAQResponse(
      status: json['status'],
      faqs: faqList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> faqsJson =
        faqs.map((faq) => faq.toJson()).toList();

    return {
      'status': status,
      'faqs': faqsJson,
    };
  }
}

class FAQ {
  final int id;
  final String question;
  final String answer;
  final String? embed_code;

  FAQ(
      {required this.id,
      required this.question,
      required this.answer,
      required this.embed_code});

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
      embed_code: json['embed_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'embed_code': embed_code,
    };
  }
}
