import 'question.dart';
import 'answer.dart';

class Quiz {
  final List<Question> questions;
  final List<Answer> userAnswers = []; 

  Quiz({required this.questions});

  void submitAnswer(Answer answer) {
    if (userAnswers.length < questions.length) {
      userAnswers.add(answer);
    }
  }

  int getScore() {
    int score = 0;
    for (var answer in userAnswers) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    return score;
  }
 
  bool get isComplete => userAnswers.length == questions.length;
}