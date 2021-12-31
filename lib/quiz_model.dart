class QuizModel {
  late String questions, correctAnswer, incorrectAnswer;

  QuizModel(
      {required this.correctAnswer,
      required this.incorrectAnswer,
      required this.questions});

  QuizModel.fromJson(Map<String, dynamic> map) {
    questions = map['question'];
    correctAnswer = map['correct_answer'];
    incorrectAnswer = map['incorrect_answers'][0];
  }
}
