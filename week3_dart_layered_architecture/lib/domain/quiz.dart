import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Question{
  final String id;
  final String title;
  final List<String> choices;
  final Map<String, int> goodChoice;

  Question({required this.title, required this.choices, this.goodChoice = const {'q': 1}}) : id = uuid.v4();
}

class Answer{
  final String id;
  final Question question;
  final String answerChoice;
  
  Answer({required this.question, required this.answerChoice}) : id = uuid.v4();

  bool isGood() => question.goodChoice.containsKey(answerChoice);
}

class Quiz{
  final String id;
  List<Question> questions;

  Quiz({required this.questions}) : id = uuid.v4();
  
  int get maxScore {
    return questions.fold(0, (sum, q) {
      int maxPoints = q.goodChoice.values.fold(0, (max, current) => current > max ? current : max);
      return sum + maxPoints;
    });
  }
  
}

class Player {
  final String id;
  String name;
  
  Player(this.name) : id = uuid.v4();

}
class Submission {
  final String id;
  final Player player; 
  final Quiz quiz;     
  final List<Answer> answers; 

  Submission({
    required this.player,
    required this.quiz,
    required this.answers,
  }) : id = uuid.v4();

  int getScoreInPoint() {
    int totalScore = 0;
    for (var answer in answers) {
      if (answer.isGood()) {
        totalScore += answer.question.goodChoice[answer.answerChoice] ?? 0;
      }
    }
    return totalScore;
  }

  int getScoreInPercentage() {
    int maxScore = quiz.maxScore;
    if (maxScore == 0) return 0;

    int actualScore = getScoreInPoint();

    return ((actualScore / maxScore) * 100).toInt();
  }
}