// faq model

class FaqModel {
  final String question;
  final String answer;

  FaqModel.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        answer = json['answer'];

  Map<String, dynamic> toJson() => {
        'question': question,
        'answer': answer,
      };
}
