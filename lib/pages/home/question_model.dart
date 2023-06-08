class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> questionList = [];

  questionList.add(Question(
    "Apakah gusi anda bengkak?",
    [
      Answer("Iya", true),
      Answer("Tidak", false),
    ],
  ));

  questionList.add(Question(
    "Apakah gusi anda robek?",
    [
      Answer("Iya", true),
      Answer("Tidak", false),
    ],
  ));

  questionList.add(Question(
    "Apakah gusi anda berdarah?",
    [
      Answer("Iya", true),
      Answer("Tidak", false),
    ],
  ));

  return questionList;
}
