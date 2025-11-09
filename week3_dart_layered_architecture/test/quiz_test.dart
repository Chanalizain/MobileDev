import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  // Create 2 questions and the quiz
  Question q1 =
      Question(title: "2+2", choices: ["1", "2", "4"], goodChoice: {"4": 5});

  Question q2 =
      Question(title: "2+3", choices: ["1", "2", "5"], goodChoice: {"5": 5});

  Quiz quiz = Quiz(questions: [q1, q2]);
  Player player = Player("Liza");

  final int maxPossibleScore = 
    (q1.goodChoice.values.first) + (q2.goodChoice.values.first); 
  test('All answers are good (100%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "4");
    Answer a2 = Answer(question: q2, answerChoice: "5");

    final Submission submission = Submission(
        player: player,
        quiz: quiz,
        answers: [a1, a2],
      );

    // Check something
    expect(submission.getScoreInPercentage(), equals(100));
    expect(submission.getScoreInPoint(), equals(10));
  });

  
}
